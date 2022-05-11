//
//  RecentSearchViewModel.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation
import UIKit

class RecentSearchViewModel: NSObject {

    var selectionHandler: ((String) -> Void)?
    let recentSearchesManager = RecentSearchesManager()

}

extension RecentSearchViewModel: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentSearchesCell.defaultReuseIdentifier,
                                                 for: indexPath) as! RecentSearchesCell
        cell.searchLabel.text = recentSearchesManager.recentSearches[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recentSearchesManager.recentSearches.count
    }

}

extension RecentSearchViewModel: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let query = recentSearchesManager.recentSearches[indexPath.row]
        selectionHandler?(query)
    }

}
