//
//  Video.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

struct Video {
    let key: String
    let site: String
    let type: String
    
    var iscomingFromYoutube: Bool {
        return site == "YouTube"
    }
    
    var isTrailer: Bool {
        return type == "Trailer"
    }
    
    init(dict: [String: Any]) {
        self.key = dict["key"] as? String ?? ""
        self.site = dict["site"] as? String ?? ""
        self.type = dict["type"] as? String ?? ""
    }
}
