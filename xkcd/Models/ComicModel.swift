//
//  ComicModel.swift
//  xkcd
//
//  Created by Galileo Guzman on 15/03/22.
//

import Foundation

struct ComicModel: Codable {
    
    // MARK: - Properties
    let num: Int
    let month: String
    let link: String
    let year: String
    let news: String
    let safeTitle: String
    let transcript: String
    let alt: String
    let img: String
    let title: String
    let day: String
    
}
