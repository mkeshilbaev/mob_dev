//
//  TopMoviesRequest.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation

struct TopMoviesRequest: MovieRequest {

    // MovieRequest protocol variables
    var path: String = "/movie/top_rated"

    var parameters: [String : Any] {
        return [
            "page": page
        ]
    }

    // Class variables
    private let page: Int

    // Initializer
    init(page: Int) {
        self.page = page
    }
}
