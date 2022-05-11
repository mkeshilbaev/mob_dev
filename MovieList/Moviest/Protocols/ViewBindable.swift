//
//  ViewBindable.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation

protocol ViewBindable {

    func getTitle() -> String
    func getSubtitle() -> String
    func getImageURL() -> URL?
    func getSubText() -> String?

}

extension ViewBindable {

    func getTitle() -> String {
        return ""
    }

    func getSubtitle() -> String {
        return ""
    }

    func getImageURL() -> URL? {
        return nil
    }

    func getSubText() -> String? {
        return nil
    }

}
