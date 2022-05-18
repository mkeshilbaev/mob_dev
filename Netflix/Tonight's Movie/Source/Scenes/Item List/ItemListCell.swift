//
//  ItemListCell.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit


protocol ItemListCellProtocol {
    func display(pictureURL: String)
    func didEndDisplaying()
}



final class ItemListCell: UICollectionViewCell {
    @IBOutlet weak var pictureImageView: UIImageView! {
        didSet {
            pictureImageView.contentMode = .scaleAspectFill
            pictureImageView.clipsToBounds = true
            pictureImageView.alpha = 0
        }
    }
    
    // MARK: - Lifecycle -
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        backgroundColor = .clear
    }
}


extension ItemListCell: ItemListCellProtocol {
    func display(pictureURL: String) {
        if let url = URL(string: pictureURL) {
            pictureImageView.kf.setImage(with: url) { image, error, _, _ in
                if image != nil && error == nil {
                    UIView.animate(withDuration: Style.Animation.duration) {
                        self.pictureImageView.alpha = 1
                        
                        self.layoutIfNeeded()
                    }
                }
            }
        }
    }
    
    func didEndDisplaying() {
        pictureImageView.kf.cancelDownloadTask()
    }
}
