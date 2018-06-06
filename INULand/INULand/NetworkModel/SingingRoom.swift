//
//  SingingRoom.swift
//  INULand
//
//  Created by Cho on 2018. 6. 5..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

class SingingRoom {
    var roomNum: String?
    var isReserved: Int?

    init(num: String, isReserved: Int) {
        self.roomNum = num
        self.isReserved = isReserved
    }
}
