//
//  SingleComicCell.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import UIKit

class SingleComicCell: UITableViewCell {
    
    // MARK: Cell identifier
    static let identifier = "SingleComicCell"
    static let height: CGFloat = 80.0
    
    @IBOutlet private var lblComicTitle: UILabel!
    @IBOutlet private var imgComic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(with presentable: ComicPresentable) {
        lblComicTitle.text = presentable.safeTitle
        imgComic.downloadImage(from: presentable.img)
    }
    
}
