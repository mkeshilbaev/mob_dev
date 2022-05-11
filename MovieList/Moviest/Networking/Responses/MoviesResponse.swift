//
//  MoviesResponse.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation

struct MoviesResponse: Codable {

    private(set) var results: [Movie]?
    private(set) var page: Int?
    private(set) var totalResults: Int?
    private(set) var totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case results
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }

}
