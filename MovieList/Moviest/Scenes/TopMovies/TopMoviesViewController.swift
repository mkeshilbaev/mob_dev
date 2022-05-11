//
//  TopMoviesViewController.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import UIKit

class TopMoviesViewController: MovieListViewController, StoryboardLoadable, Instantiatable {

    static var defaultStoryboardName: String = Constants.StoryboardName.topMovies

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Top Rated"
    }

}
