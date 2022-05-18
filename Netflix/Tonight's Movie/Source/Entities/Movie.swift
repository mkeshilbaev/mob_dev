//
//  Movie.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Foundation

struct Movie: Codable {
    let id: Int
    let title: String
    let pictureURL: String
    let backgroundURL: String
    let date: String
    let overview: String
    let runtime: Int
    let voteAverage: Double
    
    var smallPictureUrl: String {
        return "https://image.tmdb.org/t/p/w500\(pictureURL)"
    }
    
    var originalPictureUrl: String {
        return "https://image.tmdb.org/t/p/original\(pictureURL)"
    }
    
    var smallBackgroundUrl: String {
        return "https://image.tmdb.org/t/p/w500\(backgroundURL)"
    }
    
    var orignalBackgroundUrl: String {
        return "https://image.tmdb.org/t/p/original\(backgroundURL)"
    }
    
    var formattedDate: String {
        return date.format(from: "yyyy-mm-dd", to: "dd MMM yyyy")
    }
    
    var duration: String {
        return "\(runtime/60)h \(runtime % 60)min"
    }
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? Int ?? 0
        self.title = dict["title"] as? String ?? ""
        self.pictureURL = dict["poster_path"] as? String ?? ""
        self.backgroundURL = dict["backdrop_path"] as? String ?? ""
        self.date = dict["release_date"] as? String ?? ""
        self.overview = dict["overview"] as? String ?? ""
        self.runtime = dict["runtime"] as? Int ?? 0
        self.voteAverage = dict["vote_average"] as? Double ?? 0
    }
}
