//
//  Pagination.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation

enum PaginationSection: Int {
    case content = 0
    case loading = 1

    static var count: Int {
        var max: Int = 0
        while let _ = self.init(rawValue: max) {
            max += 1
        }
        return max
    }

    static let offset = 2
}
