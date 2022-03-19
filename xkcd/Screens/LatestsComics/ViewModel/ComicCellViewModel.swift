//
//  ComicCellViewModel.swift
//  xkcd
//
//  Created by Galileo Guzman on 16/03/22.
//

import Foundation

struct ComicCellViewModel {
    
    // MARK: - Properties
    
    let comic: ComicModel

}

extension ComicCellViewModel: ComicPresentable {
    
    // MARK: - Properties
    
    var num: String {
        return "\(comic.num)"
    }
    var safeTitle: String {
        return comic.safeTitle
    }
    
    var img : String {
        return comic.img
    }
    
    var date : String {
        return "\(comic.day) \(comic.month) \(comic.year)"
    }
    

}
