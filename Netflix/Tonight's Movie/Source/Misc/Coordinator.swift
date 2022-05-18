//
//  Coordinator.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

protocol Coordinator: class {
    var children: [Coordinator] { get set }
    
    func start()
}
