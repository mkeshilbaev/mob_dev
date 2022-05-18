//
//  DetailsCoordinator.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Foundation
import UIKit


class DetailsCoordinator: Coordinator {
    var children: [Coordinator]
    
    private let navigationController: UINavigationController
    
    private let id: Int
    private let type: Item.ContentType
    
    // MARK: - Lifecycle -
    init(navigationController: UINavigationController, id: Int, type: Item.ContentType) {
        self.navigationController = navigationController
        self.id = id
        self.type = type
        
        children = []
    }

    // MARK: - Methods -
    func start() {
        let interactor = DetailsInteractor()
        let presenter = DetailsPresenter(interactor: interactor, coordinator: self, id: id, type: type)
        let viewController = DetailsViewController.instantiate(with: presenter)

        interactor.output = presenter
        presenter.output = viewController

        navigationController.pushViewController(viewController, animated: true)
    }
}

// PRESENTER -> COORDINATOR
extension DetailsCoordinator: DetailsCoordinatorInput {    
    func showRecommendations(with viewController: UIViewController, into view: UIView, with items: [Item]) {
        let coodinator = ItemListCoordinator(navigationController: navigationController)
        children.append(coodinator)
        coodinator.start()
        
        coodinator.show(viewController: viewController, into: view)
        coodinator.update(with: items)
    }
}
