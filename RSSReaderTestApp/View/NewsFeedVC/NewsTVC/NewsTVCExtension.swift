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
        
        publisherImageView.image = UIImage(named: "LentaruLogo")
        
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
        
        publisherLabel.text = "Lenta.ru"
        publisherLabel.font = .boldSystemFont(ofSize: 18)
        publisherLabel.textAlignment = .left
        publisherLabel.textColor = .white
        
        addSubview(publisherLabel)
        
        let publisherLabelConstraints = [
            publisherLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            publisherLabel.leadingAnchor.constraint(equalTo: publisherImageView.trailingAnchor, constant: 10),
            publisherLabel.heightAnchor.constraint(equalToConstant: 20)]
        NSLayoutConstraint.activate(publisherLabelConstraints)
    }
    
    func makePublicationTime() {
        publicationTimeLabel = UILabel()
        publicationTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        publicationTimeLabel.text = "сейчас"
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
        
        newsTitleLabel.text = "Самую высотную в России застройку обнаружили в Подмосковье"
        newsTitleLabel.font = .systemFont(ofSize: 16)
        newsTitleLabel.textColor = .white
        newsTitleLabel.alpha = 0.8
        newsTitleLabel.textAlignment = .left
        newsTitleLabel.numberOfLines = 2
        
        addSubview(newsTitleLabel)
        
        newsTitleLabelConstraints = [
            newsTitleLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            newsTitleLabel.leadingAnchor.constraint(equalTo: publisherLabel.leadingAnchor),
            newsTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)]
        NSLayoutConstraint.activate(newsTitleLabelConstraints)
    }
    
    func makeNewsDescriptionLabel() {
        newsDescriptionLabel = UILabel()
        newsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        newsDescriptionLabel.isHidden = true
        newsDescriptionLabel.text = #"Лидерами по высотности жилой застройки среди российских городов оказались четыре населенных пункта Московской области — Котельники, Красногорск, Одинцово и Реутов. Средняя высотность новостроек в этих городах в мае 2019-го составила 25 этажей. “Серебро” получил Долгопрудный с показателем в 23 этажа."#
        newsDescriptionLabel.font = .systemFont(ofSize: 16)
        newsDescriptionLabel.textColor = .white
        newsDescriptionLabel.alpha = 0.8
        newsDescriptionLabel.textAlignment = .left
        newsDescriptionLabel.numberOfLines = 0
        
        addSubview(newsDescriptionLabel)
        
        newsDescriptionLabelConstraints = [
            newsDescriptionLabel.topAnchor.constraint(equalTo: publisherLabel.bottomAnchor, constant: 2),
            newsDescriptionLabel.leadingAnchor.constraint(equalTo: publisherLabel.leadingAnchor),
            newsDescriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            newsDescriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)]
//        NSLayoutConstraint.activate(newsDescriptionLabelConstraints)
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
        
        discloseInfoLabelConstraints = [
            discloseInfoLabel.topAnchor.constraint(equalTo: newsTitleLabel.bottomAnchor, constant: 10),
            discloseInfoLabel.leadingAnchor.constraint(equalTo: newsTitleLabel.leadingAnchor),
            discloseInfoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)]
        NSLayoutConstraint.activate(discloseInfoLabelConstraints)
    }
    
    func discloseNewsDescription() {
        print("#function")
        
        if !isDisclosed {
            NSLayoutConstraint.deactivate(newsTitleLabelConstraints)
            newsTitleLabel.isHidden = true
            NSLayoutConstraint.deactivate(discloseInfoLabelConstraints)
            discloseInfoLabel.isHidden = true
            
            NSLayoutConstraint.activate(newsDescriptionLabelConstraints)
            newsDescriptionLabel.isHidden = false
        } else {
            NSLayoutConstraint.deactivate(newsDescriptionLabelConstraints)
            newsDescriptionLabel.isHidden = true
            
            NSLayoutConstraint.activate(discloseInfoLabelConstraints)
            discloseInfoLabel.isHidden = false
            NSLayoutConstraint.activate(newsTitleLabelConstraints)
            newsTitleLabel.isHidden = false
        }
        
        isDisclosed = !isDisclosed
    }
}
