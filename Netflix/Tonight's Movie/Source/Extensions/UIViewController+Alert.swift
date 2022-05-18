//
//  UIViewController+Alert.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

extension UIViewController {
    
    func showAlertError(message: String?) {
        let alert = UIAlertController(title: Translation.Default.error, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Translation.Default.ok, style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
