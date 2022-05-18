//
//  Convert.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

struct Convert {
    static func convertIntoItems(movies: [Movie]) -> [Item] {
        return movies.filter {
            return !$0.pictureURL.isEmpty
        }.map {
            return Item(id: $0.id, pictureURL: $0.pictureURL, contentType: .Movie)
        }
    }
    
    static func convertIntoItems(tvShows: [TVShow]) -> [Item] {
        return tvShows.filter {
            return !$0.pictureURL.isEmpty
        }.map {
            return Item(id: $0.id, pictureURL: $0.pictureURL, contentType: .TVShow)
        }
    }
}
