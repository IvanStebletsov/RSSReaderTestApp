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
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.1405375302, green: 0.1605641544, blue: 0.1772543788, alpha: 1)
        navigationController?.navigationBar.barStyle = .black
        navigationItem.title = "Today's News"
        
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
//        blurEffectView.layer.shouldRasterize = true
//        blurEffectView.layer.rasterizationScale = UIScreen.main.nativeScale
        backgroundImageView.addSubview(blurEffectView)
    }
    
}
