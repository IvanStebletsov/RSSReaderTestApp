//
//  NewsTVCExtension.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension NewsTVCell {
    
    // MARK: - UI Configuration
    func makePublisherImageView() {
        publisherImageView = UIImageView()
        publisherImageView.translatesAutoresizingMaskIntoConstraints = false
        
        publisherImageView.layer.cornerRadius = 5
        publisherImageView.layer.masksToBounds = true
        publisherImageView.layer.shouldRasterize = true
        publisherImageView.layer.rasterizationScale = UIScreen.main.nativeScale
        
        addSubview(publisherImageView)
        
        let publisherImageViewConstraints = [
            publisherImageView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            publisherImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            publisherImageView.heightAnchor.constraint(equalToConstant: 20),
            publisherImageView.widthAnchor.constraint(equalTo: publisherImageView.heightAnchor)]
        NSLayoutConstraint.activate(publisherImageViewConstraints)
    }
    
    func makePublisherLabel() {
        publisherLabel = UILabel()
        publisherLabel.translatesAutoresizingMaskIntoConstraints = false
        
        publisherLabel.font = .boldSystemFont(ofSize: 16)
        publisherLabel.textAlignment = .left
        publisherLabel.textColor = .white
        
        addSubview(publisherLabel)
        
        let publisherLabelConstraints = [
            publisherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            publisherLabel.leadingAnchor.constraint(equalTo: publisherImageView.trailingAnchor, constant: 10),
            publisherLabel.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(publisherLabelConstraints)
    }
    
    func makeNewsImageView() {
        newsImageView = UIImageView()
        newsImageView.translatesAutoresizingMaskIntoConstraints = false
        
        newsImageView.image = UIImage(named: "newsImageMock")
        newsImageView.contentMode = .scaleAspectFill
        newsImageView.layer.cornerRadius = 5
        newsImageView.layer.masksToBounds = true
        newsImageView.layer.shouldRasterize = true
        newsImageView.layer.rasterizationScale = UIScreen.main.nativeScale
        
        addSubview(newsImageView)
        
        let newsImageViewConstraints = [
            newsImageView.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            newsImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            newsImageView.heightAnchor.constraint(equalToConstant: 40),
            newsImageView.widthAnchor.constraint(equalTo: newsImageView.heightAnchor)]
        NSLayoutConstraint.activate(newsImageViewConstraints)
    }
    
    func makePublicationTime() {
        publicationTimeLabel = UILabel()
        publicationTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        publicationTimeLabel.font = .boldSystemFont(ofSize: 12)
        publicationTimeLabel.textColor = .white
        publicationTimeLabel.alpha = 0.4
        publicationTimeLabel.textAlignment = .left
        
        addSubview(publicationTimeLabel)
        
        let publicationTimeLabelConstraints = [
            publicationTimeLabel.bottomAnchor.constraint(equalTo: publisherLabel.bottomAnchor),
            publicationTimeLabel.leadingAnchor.constraint(equalTo: publisherLabel.trailingAnchor, constant: 5)]
        NSLayoutConstraint.activate(publicationTimeLabelConstraints)
    }
    
    func makeNewsTitleLabel() {
        newsTitleLabel = UILabel()
        newsTitleLabel.translatesAutoresizingMaskIntoConstraints = false

        newsTitleLabel.font = .systemFont(ofSize: 14)
        newsTitleLabel.textColor = .white
        newsTitleLabel.alpha = 0.8
        newsTitleLabel.textAlignment = .left
        newsTitleLabel.numberOfLines = 2
        
        addSubview(newsTitleLabel)
        
        bottomNewsTitleLabelConstraints = newsTitleLabel.bottomAnchor.constraint(equalTo: discloseInfoLabel.topAnchor, constant: -10)
        bottomNewsTitleLabelConstraints?.isActive = true
        let newsTitleLabelConstraints = [
            newsTitleLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            newsTitleLabel.leadingAnchor.constraint(equalTo: publisherLabel.leadingAnchor),
            newsTitleLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -10)]
        NSLayoutConstraint.activate(newsTitleLabelConstraints)
    }
    
    func makeNewsDescriptionLabel() {
        newsDescriptionLabel = UILabel()
        newsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newsDescriptionLabel.font = .systemFont(ofSize: 14)
        newsDescriptionLabel.textColor = .white
        newsDescriptionLabel.alpha = 0.8
        newsDescriptionLabel.textAlignment = .left
        newsDescriptionLabel.numberOfLines = 0
        newsDescriptionLabel.alpha = 0
        
        addSubview(newsDescriptionLabel)
        
        bottomNewsDescriptionLabelConstraint = newsDescriptionLabel.bottomAnchor.constraint(equalTo: discloseInfoLabel.topAnchor, constant: -10)
        let newsDescriptionLabelConstraints = [
            newsDescriptionLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: publisherLabel.leadingAnchor),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: newsImageView.leadingAnchor, constant: -10)]
        NSLayoutConstraint.activate(newsDescriptionLabelConstraints)
    }
    
    func makeDiscloseInfoLabel() {
        discloseInfoLabel = UILabel()
        discloseInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        discloseInfoLabel.text = "Просмотреть"
        discloseInfoLabel.font = .boldSystemFont(ofSize: 12)
        discloseInfoLabel.textColor = .white
        discloseInfoLabel.alpha = 0.4
        discloseInfoLabel.textAlignment = .left
        
        addSubview(discloseInfoLabel)
        
        let discloseInfoLabelConstraints = [
            discloseInfoLabel.leadingAnchor.constraint(equalTo: publisherLabel.leadingAnchor),
            discloseInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)]
        NSLayoutConstraint.activate(discloseInfoLabelConstraints)
    }
    
    func discloseNewsDescription() {
        if !isDisclosed {
            UILabel.animate(withDuration: 0.25, animations: { [unowned self] in
                self.newsTitleLabel.alpha = 0
                self.bottomNewsTitleLabelConstraints?.isActive = false
                self.bottomNewsDescriptionLabelConstraint?.isActive = true
            }) { [unowned self] (_) in
                self.discloseInfoLabel.text = "Скрыть"
                UILabel.animate(withDuration: 0.5, animations: {
                    self.newsDescriptionLabel.alpha = 1
                })
            }
        } else {
            UILabel.animate(withDuration: 0.25, animations: { [unowned self] in
                self.newsDescriptionLabel.alpha = 0
                self.bottomNewsDescriptionLabelConstraint?.isActive = false
                self.bottomNewsTitleLabelConstraints?.isActive = true
            }) { [unowned self] (_) in
                self.discloseInfoLabel.text = "Просмотреть"
                UILabel.animate(withDuration: 0.5, animations: {
                    self.newsTitleLabel.alpha = 1
                })
            }
        }
        
        isDisclosed = !isDisclosed
    }
}
