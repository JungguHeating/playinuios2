//
//  RentalInfo.swift
//  INULand
//
//  Created by Cho on 2018. 6. 6..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

//get the json of renttal information from server
//{
//    Cycle1 = 30,
//    Cycle2 = 40,
//    InlineSkate = 20,
//    KickBoard = 10
//}

class RentalInfo {
    var cycle1: Int?
    var cycle2: Int?
    var kickboard: Int?
    var inlineSkate: Int?
    
    init(cycle1: Int, cycle2: Int, kickboard: Int, inlineSkate: Int) {
        self.cycle1 = cycle1
        self.cycle2 = cycle2
        self.kickboard = kickboard
        self.inlineSkate = inlineSkate
    }
}
