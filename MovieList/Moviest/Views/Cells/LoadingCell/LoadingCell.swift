//
//  LoadingCell.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import UIKit

class LoadingCell: BaseTableViewCell, NibLoadable, Instantiatable {

    override func awakeFromNib() {
        selectionStyle = .none
    }

}
