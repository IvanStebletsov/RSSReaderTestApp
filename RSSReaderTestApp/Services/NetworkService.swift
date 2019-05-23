//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class NetworkService: Networking {
    
    // MARK: - Properties

    
    // MARK: - Methods
    func fetchNewsFeed(on url: String, completion: @escaping () -> ()) {
        
        
        guard let url = URL(string: url) else { return }

        let urlSession = URLSession.shared
        
        urlSession.dataTask(with: url) { (data, response, error) in

            
            }.resume()
    }
}
