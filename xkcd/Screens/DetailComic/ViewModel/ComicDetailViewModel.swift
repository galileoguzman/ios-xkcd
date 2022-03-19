//
//  ComicDetailViewModel.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import Foundation
import UIKit

final class ComicDetailViewModel {
    
    // MARK: - Properties

    private let presentable: ComicPresentable
    
    // MARK: - Data biding
    
    var comicImageLoaded: (() -> Void)?
    
    var title: String {
        return presentable.date
    }
    
    var safeTitle: String {
        return presentable.safeTitle
    }
    
    var image: UIImage {
        let imageView = UIImageView()
        imageView.downloadImage(from: presentable.img)
        return imageView.image!
    }
    
    // MARK: - Initialization

    init(presentable: ComicPresentable) {
        // Set properties
        self.presentable = presentable
        
    }
    
}
