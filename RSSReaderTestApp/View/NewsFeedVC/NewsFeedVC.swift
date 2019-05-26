//
//  NewsFeedVC.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

class NewsFeedVC: UIViewController {
    
    // MARK: - Properties
    let cellId = "Cell"
    var viewModel: NewsFeedVMProtocol!
    var selectedRow: IndexPath?
    
    // MARK: - UI elements
    var newsFeedTableView: UITableView!
    var backgroundImageView: UIImageView!
    var screenTitleLabel: UILabel!
    var emptyFeedView: UIView!
    var refreshControl: UIRefreshControl!
    var activityIndocatorView: UIActivityIndicatorView!
    
    // MARK: - Initialization
    init(viewModel: NewsFeedVMProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cicle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        makeBackgroundImageView()
        makeNewsFeedTableView()
        makeEmptyNewsFeedLabel()
        makeRefreshControl()

        viewModel.fetchData { [weak self] (response) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let response = response {
                    self.presentAlertController(response)
                    self.newsFeedTableView.separatorColor = .clear
                    self.emptyFeedView.isHidden = false
                } else {
                    self.newsFeedTableView.reloadData()
                    self.newsFeedTableView.separatorColor = #colorLiteral(red: 0.4470869303, green: 0.4430034161, blue: 0.4511971474, alpha: 1)
                    self.emptyFeedView.isHidden = true
                }
            }
        }
    }
    
}

