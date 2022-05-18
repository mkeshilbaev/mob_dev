//
//  Item.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

struct Item: Codable {
    let id: Int
    let pictureURL: String
    let contentType: Item.ContentType
    
    var smallPictureUrl: String {
        return "https://image.tmdb.org/t/p/w500\(pictureURL)"
    }
    
    var originalPictureUrl: String {
        return "https://image.tmdb.org/t/p/original\(pictureURL)"
    }
    
    enum ContentType: String, Codable {
        case Movie, TVShow
    }
}
