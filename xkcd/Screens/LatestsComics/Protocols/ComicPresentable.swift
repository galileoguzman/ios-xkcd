//
//  ComicPresentable.swift
//  xkcd
//
//  Created by Galileo Guzman on 16/03/22.
//

import Foundation

protocol ComicPresentable {
    
    // MARK: - Properties

    var num: String  { get }
    var safeTitle: String { get }
    var img: String { get }
    var date: String { get }

}
