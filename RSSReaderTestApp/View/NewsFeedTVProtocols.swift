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
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? NewsTVCell else { return UITableViewCell() }
        
        cell.set(viewModel: self.viewModel.viewModelForCell(at: indexPath))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRow = indexPath
        let selectedCell = tableView.cellForRow(at: indexPath) as! NewsTVCell
        
        tableView.beginUpdates()
        selectedCell.discloseNewsDescription()
        tableView.endUpdates()
    }
    
}
