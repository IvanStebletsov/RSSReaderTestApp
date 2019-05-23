//
//  NewsTableViewCell.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class NewsTVCell: UITableViewCell {
    
    // MARK: - Properties
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
    
    override func prepareForReuse() {
        newsDescriptionLabel.alpha = 0
        bottomNewsDescriptionLabelConstraint?.isActive = false
        bottomNewsTitleLabelConstraints?.isActive = true
        newsTitleLabel.alpha = 1
        discloseInfoLabel.text = "Просмотреть"
    }
}
