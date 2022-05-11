//
//  EmptyView.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import UIKit

class EmptyView: UIView, NibLoadable, Instantiatable {

    @IBOutlet private weak var emptyStateLabel: UILabel!

    func updateLabel(string: String) {
        if !string.isEmpty {
            emptyStateLabel.text = string
        }
    }

}
