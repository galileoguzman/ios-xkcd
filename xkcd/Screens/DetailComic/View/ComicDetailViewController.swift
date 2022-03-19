//
//  ComicDetailViewController.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import UIKit

class ComicDetailViewController: UIViewController, Storyboardable {

    @IBOutlet weak var imgComicCover: UIImageView!
    @IBOutlet weak var lblComicTitle: UILabel!
    
    // MARK: Public access
    
    var viewModel:ComicDetailViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initController()
    }
    
    private func initController() {
        // View controller properties
        title = viewModel.title
        lblComicTitle.text = viewModel.safeTitle
        imgComicCover.image = viewModel.image
        
    }

}
