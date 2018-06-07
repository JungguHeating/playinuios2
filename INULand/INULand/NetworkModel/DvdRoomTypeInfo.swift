//
//  DVDRoomTypeInfo.swift
//  INULand
//
//  Created by 이준상 on 2018. 6. 7..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

//get the json of renttal information from server
//{
//    "twoPeople": 5,
//    "fourPeople": 10
//}

class DVDRoomTypeInfo {
    var twoPeople: Int?
    var fourPeople: Int?

    init(twoPeople: Int, fourPeople: Int) {
        self.twoPeople = twoPeople
        self.fourPeople = fourPeople
    }
}
