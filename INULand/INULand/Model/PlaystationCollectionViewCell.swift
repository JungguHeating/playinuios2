//
//  PlaystationCollectionViewCell.swift
//  INULand
//
//  Created by Cho on 2018. 6. 6..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class PlaystationCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var roomOneLabel: UILabel!
    @IBOutlet weak var roomTwoLabel: UILabel!
    @IBOutlet weak var roomThreeLabel: UILabel!
    @IBOutlet weak var roomFourLabel: UILabel!
    
    @IBOutlet weak var roomOneButton: UIButton!
    @IBOutlet weak var roomTwoButton: UIButton!
    @IBOutlet weak var roomThreeButton: UIButton!
    @IBOutlet weak var roomFourButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
