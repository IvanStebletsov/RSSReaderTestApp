//
//  NewsFeedVCExtension.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension NewsFeedVC {

    // MARK: - UI Configuration
    func makeNewsFeedTableView() {
        newsFeedTableView = UITableView()
        newsFeedTableView.translatesAutoresizingMaskIntoConstraints = false
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1881980896, green: 0.1881759465, blue: 0.1922885776, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Новости"
        
        newsFeedTableView.isHidden = true
        newsFeedTableView.backgroundColor = .clear
        newsFeedTableView.separatorStyle = .singleLine
        newsFeedTableView.register(NewsTVCell.self, forCellReuseIdentifier: cellId)
        
        newsFeedTableView.delegate = self
        newsFeedTableView.dataSource = self
        
        view.addSubview(newsFeedTableView)
        
        let safeArea = view.safeAreaLayoutGuide
        
        let newsFeedTableViewConstraints = [
            newsFeedTableView.topAnchor.constraint(equalTo: view.topAnchor),
            newsFeedTableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            newsFeedTableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            newsFeedTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(newsFeedTableViewConstraints)
    }
    
    func makeBackgroundImageView() {
        backgroundImageView = UIImageView()
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "NewsService")
        
        backgroundImageView.image = image
        backgroundImageView.contentMode = .scaleAspectFill
        
        view.insertSubview(backgroundImageView, at: 0)
        
        let backgroundImageViewConstraints = [
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)]
        NSLayoutConstraint.activate(backgroundImageViewConstraints)
        
        let blurEffect = UIBlurEffect(style: .dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundImageView.addSubview(blurEffectView)
    }
    
    func makeEmptyStoreLabel() {
        emptyFeedView = UIView()
        emptyFeedView.translatesAutoresizingMaskIntoConstraints = false
        let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        emptyFeedView.backgroundColor = #colorLiteral(red: 0.1881980896, green: 0.1881759465, blue: 0.1922885776, alpha: 1)
        emptyFeedView.alpha = 0.7
        emptyFeedView.layer.masksToBounds = true
        emptyFeedView.layer.cornerRadius = 15
        text.textAlignment = .center
        text.numberOfLines = 0
        text.text = "Новостей нет"
        text.textColor = #colorLiteral(red: 0.4665635824, green: 0.46639961, blue: 0.4829245806, alpha: 1)
        emptyFeedView.isHidden = true
        
        view.addSubview(emptyFeedView)
        emptyFeedView.addSubview(text)
        
        let emptyFeedViewConstraints = [
            emptyFeedView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyFeedView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            text.leadingAnchor.constraint(equalTo: emptyFeedView.leadingAnchor, constant: 15),
            text.trailingAnchor.constraint(equalTo: emptyFeedView.trailingAnchor, constant: -15),
            text.topAnchor.constraint(equalTo: emptyFeedView.topAnchor, constant: 10),
            text.bottomAnchor.constraint(equalTo: emptyFeedView.bottomAnchor, constant: -10)]
        NSLayoutConstraint.activate(emptyFeedViewConstraints)
    }
    
    func makeRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.attributedTitle = NSAttributedString(string: "Загрузка...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        refreshControl.addTarget(self, action: #selector(refreshNewsFeed), for: UIControl.Event.valueChanged)
        newsFeedTableView.addSubview(refreshControl)
    }
    
    @objc func refreshNewsFeed() {
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
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func presentAlertController(_ error: DataResponseError) {
        let alertController = UIAlertController(title: error.reason, message: nil, preferredStyle: .alert)
        let okAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAlertAction)
        
        DispatchQueue.main.async { [weak self] in
            self?.present(alertController, animated: true, completion: nil)
        }
    }
    
}
