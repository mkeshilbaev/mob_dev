//
//  DiscoverCell.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

protocol DiscoverCellProtocol {
    func display(title: String)
}

final class DiscoverCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = ""
            titleLabel.textColor = Colors.white
            titleLabel.font = Fonts.large
        }
    }
    
    @IBOutlet weak var contenairView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        selectionStyle = .none
        backgroundColor = Colors.black
    }    
}

extension DiscoverCell: DiscoverCellProtocol {
    func display(title: String) {
        UIView.animate(withDuration: Style.Animation.duration) {
            self.titleLabel.text = title
            
            self.layoutIfNeeded()
        }
    }
}
