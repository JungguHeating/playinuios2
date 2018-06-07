//
//  Culture2CollectionViewCell.swift
//  INULand
//
//  Created by 김진우 on 2018. 6. 5..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class Culture2CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    @IBOutlet weak var contents: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.movieImage.layer.cornerRadius = 5
        self.movieImage.layer.borderWidth = 1.0
        self.movieImage.layer.borderColor = UIColor.clear.cgColor
        self.movieImage.layer.masksToBounds = true
        
        self.contents.isEditable = false
        
    }

}
