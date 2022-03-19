//
//  LastComicCell.swift
//  xkcd
//
//  Created by Galileo Guzman on 18/03/22.
//

import UIKit

class LastComicCell: UITableViewCell {
    
    // MARK: Cell identifier
    static let identifier = "LastComicCell"
    static let height: CGFloat = 200.0

    @IBOutlet private var imgComicCover: UIImageView!
    @IBOutlet private var lblComicTitle: UILabel!
    
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
        imgComicCover.downloadImage(from: presentable.img)
    }
    
}
