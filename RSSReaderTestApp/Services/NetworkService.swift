//
//  NetworkManager.swift
//  OpenWeatherTestApp
//
//  Created by Ivan Stebletsov on 06/03/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import Foundation

class NetworkService: Networking {

    // MARK: - Methods
    func fetchData(from url: String, completion: @escaping ((Result<Data, DataResponseError>, URLResponse?) -> ())) {
        
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            if error != nil { completion(Result.failure(.connection), nil); print(error!.localizedDescription) }
            
            guard let httpResponse = response as? HTTPURLResponse, let data = data else { return }
            
            print(httpResponse.statusCode)
            print(data)
            
            guard httpResponse.hasSuccessStatusCode else { completion(Result.failure(.network), response); return }
            
            completion(Result.success(data), response)
            
            }.resume()
    }
}
