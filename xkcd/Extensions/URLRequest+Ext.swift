//
//  URLRequest+Ext.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import Foundation

enum HTTPMethod: String{
    case GET = "GET"
}

extension URLRequest {
    init(_ url: URL, method: HTTPMethod) {
        self.init(url: url)
        self.httpMethod = method.rawValue
    }
}
