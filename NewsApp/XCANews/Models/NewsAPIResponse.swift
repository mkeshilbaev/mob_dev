//
//  NewsAPIResponse.swift
//  XCANews
//
//  Created by Madi Keshilbayev on 01.05.2022.
//

import Foundation

struct NewsAPIResponse: Decodable {
    
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
    
}
