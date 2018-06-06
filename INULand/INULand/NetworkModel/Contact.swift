//
//  Contact.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

class userinfo {
    var noShow: Int?
    var userName: String?
    var userId: String?
    var reserved: Int?
    var resTime: String?
    var roomTime: String?
    
    
    init(Kind_num: Int, Stu_id: String, Stu_Noshow: Int, Stu_name: String, resTime: String, roomTime: String){
        self.noShow = Stu_Noshow
        self.userName = Stu_name
        self.userId = Stu_id
        self.reserved = Kind_num
        self.resTime = resTime
        self.roomTime = roomTime
    }
    
}

//https://playground-e61bc.firebaseapp.com/stu_status
