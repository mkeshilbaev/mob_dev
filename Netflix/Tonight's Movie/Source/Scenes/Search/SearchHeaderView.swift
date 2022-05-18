//
//  SearchHeaderView.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

protocol SearchHeaderViewProtocol {
    func display(title: String)
}

final class SearchHeaderView: UICollectionReusableView {
    
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.text = ""
            titleLabel.textColor = Colors.white
            titleLabel.font = Fonts.large
        }
    }
    
}

extension SearchHeaderView: SearchHeaderViewProtocol {
    func display(title: String) {
        UIView.animate(withDuration: Style.Animation.duration) {
            self.titleLabel.text = title
            
            self.layoutIfNeeded()
        }
    }
}
