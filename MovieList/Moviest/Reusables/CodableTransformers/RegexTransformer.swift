//
//  RegexTransformer.swift
//  Moviest
//
//  Created by Madi Keshilbayev on 10.05.2022.
//  Copyright © 2022 Madi Keshilbayev. All rights reserved.
//

import Foundation

public class RegexTransformer: CodableTransformer {

    public typealias Input = String
    public typealias Output = NSRegularExpression

    public init() {}

    public func transform(_ decoded: String) throws -> NSRegularExpression {
        return try NSRegularExpression(pattern: decoded, options: [])
    }

    public func transform(_ encoded: NSRegularExpression) throws -> String {
        return encoded.pattern
    }

}
