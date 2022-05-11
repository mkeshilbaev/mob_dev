//
//  Response.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation
import Alamofire

struct Response<Value: Codable> {

    var request: URLRequest?
    var response: HTTPURLResponse?
    var data: Data?
    var result: Result<Value, NetworkError>

}
