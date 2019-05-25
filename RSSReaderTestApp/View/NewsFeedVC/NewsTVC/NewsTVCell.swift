//
//  NewsTVCell.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    // MARK: - Properties
    var viewModel: NewsTVCellVMProtocol!
    var isDisclosed = false
    var bottomNewsTitleLabelConstraints: NSLayoutConstraint?
    var bottomNewsDescriptionLabelConstraint: NSLayoutConstraint?
    
    // MARK: - UI elements
    var publisherImageView: UIImageView!
    var publisherLabel: UILabel!
    var newsImageView: UIImageView!
    var publicationTimeLabel: UILabel!
    var newsTitleLabel: UILabel!
    var newsDescriptionLabel: UILabel!
    var discloseInfoLabel: UILabel!
    var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        
        makePublisherImageView()
        makePublisherLabel()
        makePublicationTime()
        makeNewsImageView()
        makeDiscloseInfoLabel()
        makeNewsDescriptionLabel()
        makeNewsTitleLabel()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func set(viewModel: NewsTVCellVMProtocol) {
        publisherImageView.image = viewModel.publisher() == "Газета.ru" ? UIImage(named: "GazetaruLogo") : UIImage(named: "LentaruLogo")
        publisherLabel.text = viewModel.publisher()
        publicationTimeLabel.text = viewModel.pubTime()
        newsTitleLabel.text = viewModel.title()
        newsDescriptionLabel.text = viewModel.description()
        
        viewModel.newsImage { [weak self] (data) in
            guard let self = self, let data = data else { return }
            DispatchQueue.main.async {
                self.newsImageView.image = UIImage(data: data)
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        publisherLabel.text = ""
        publisherImageView.image = nil
        newsImageView.image = UIImage(named: "newsImageMock")
        publicationTimeLabel.text = ""
        newsTitleLabel.text = ""
        newsDescriptionLabel.text = ""
        
        newsDescriptionLabel.alpha = 0
        bottomNewsDescriptionLabelConstraint?.isActive = false
        bottomNewsTitleLabelConstraints?.isActive = true
        newsTitleLabel.alpha = 1
        discloseInfoLabel.text = "Просмотреть"
    }
}
