//
//  UITableView+ReuseIdentifier.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import UIKit

extension UITableViewCell {

    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }

}
