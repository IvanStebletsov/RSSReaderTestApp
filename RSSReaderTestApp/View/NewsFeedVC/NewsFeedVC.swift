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
        viewModel.fetchData { [weak self] (response) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                if let response = response {
                    self.presentAlertController(response)
                    self.newsFeedTableView.isHidden = true
                    self.emptyFeedView.isHidden = false
                } else {
                    self.newsFeedTableView.reloadData()
                    self.newsFeedTableView.isHidden = false
                    self.emptyFeedView.isHidden = true
                }
            }
        }
        makeBackgroundImageView()
        makeNewsFeedTableView()
        makeEmptyStoreLabel()
        makeRefreshControl()
    }
    
}

