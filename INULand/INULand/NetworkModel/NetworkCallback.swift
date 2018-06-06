//
//  NetworkCallback.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

protocol NetworkCallback {
    func networkSuc(resultdata : Any, code: String, tag: Int)
    func networkFail(code: String)
}
