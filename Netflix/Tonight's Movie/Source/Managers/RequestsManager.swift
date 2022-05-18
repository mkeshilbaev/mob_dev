//
//  RequestsManager.swift
//  Tonight's Movie
//
//  Created by Madi Keshilbayev on 13.05.2022.
//

import Alamofire

protocol HasRequestsManager {
    var requestsManager: RequestsManagerProtocol { get }
}


protocol RequestsManagerProtocol {
    func registerRequest(with screen: Screen, request: Request)
    func cancelRequests(of screen: Screen)
}


final class RequestsManager {
    private var requests: [Screen: [Request]]
    
    init() {
        requests = [:]
        
        for screen in Screen.allCases {
            requests[screen] = []
        }
    }
}


extension RequestsManager: RequestsManagerProtocol {
    func registerRequest(with screen: Screen, request: Request) {
        requests[screen]?.append(request)        
    }
    
    func cancelRequests(of screen: Screen) {
        requests[screen]?.forEach {
            $0.cancel()
        }
        requests[screen]?.removeAll()
    }
}
