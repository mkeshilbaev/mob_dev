//
//  AppCoordinator.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow
    var children: [Coordinator]

    init(window: UIWindow) {
        self.window = window
        self.children = []
    }

    func start() {
        // Perform initial application seutp.
        setupAfterLaunch()

        // Start your first flow here. For example, this is the
        // ideal place for deciding if you should show login or main flows.
        showMain()

        // Finally make the window key and visible.
        window.makeKeyAndVisible()
    }

    private func showMain() {
        let coordinator = TabBarCoordinator(window: window)
        children = [coordinator]
        coordinator.start()
    }

    private func setupAfterLaunch() {
        // Perform initial app setup after launch like analytics, integrations and more.
    }
}
