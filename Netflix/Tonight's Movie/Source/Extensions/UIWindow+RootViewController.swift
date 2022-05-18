//
//  UIWindow+RootViewController.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

extension UIWindow {
    func updateRootViewController(with viewController: UIViewController) {
        UIView.transition(with: self, duration: 0.2, options: .transitionCrossDissolve, animations: {
            self.rootViewController = viewController
        }, completion: nil)
    }
}
