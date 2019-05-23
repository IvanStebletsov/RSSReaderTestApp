//
//  NewsFeedTVProtocols.swift
//  RSSReaderTestApp
//
//  Created by Ivan Stebletsov on 22/05/2019.
//  Copyright © 2019 Ivan Stebletsov. All rights reserved.
//

import UIKit

extension NewsFeedVC: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - UITableViewDataSource / Delegate protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print(#function, indexPath.row)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NewsTVCell else { return UITableViewCell() }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function, indexPath.row)
        selectedRow = indexPath
        let cell = tableView.cellForRow(at: indexPath) as! NewsTVCell
        
        tableView.beginUpdates()
        cell.discloseNewsDescription()
        tableView.endUpdates()
    }
    
}
