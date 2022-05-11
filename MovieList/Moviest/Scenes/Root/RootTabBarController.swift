//
//  RootTabBarController.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import UIKit

class RootTabBarController: UITabBarController, StoryboardLoadable, Instantiatable {
    
    static var defaultStoryboardName: String = Constants.StoryboardName.root

    override func viewDidLoad() {
        super.viewDidLoad()
        initWithCustom()
    }

    func initWithCustom() {
        let topMoviesViewController = TopMoviesViewController.instantiate()
        topMoviesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
        topMoviesViewController.viewModel = TopMoviesViewModel()
        let topMoviesNavigationController = BaseNavigationController(rootViewController: topMoviesViewController)

        let searchViewController = SearchViewController.instantiate()
        searchViewController.viewModel = SearchViewModel()
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
        let searchNavigationViewController = BaseNavigationController(rootViewController: searchViewController)

        viewControllers = [topMoviesNavigationController, searchNavigationViewController]
    }

}
