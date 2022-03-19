//
//  NetworkManager.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}

}
