//
//  NetworkModel.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import Foundation

import Alamofire
import UIKit

class NetworkModel{
    private let profileURL = "https://playground-e61bc.firebaseapp.com/stu_status"
    var view : NetworkCallback
    
    init(_ view: NetworkCallback) {
        self.view = view
    }
    
    // 프로필 상태 가져오기
    func getProfile() {
        
        Alamofire.request(profileURL, method: .get, parameters: nil, headers: nil) .responseJSON { res in
            
            switch res.result{
            case .success(let item):
                self.view.networkSuc(resultdata: item, code: "Profile", tag: 10)
                break
            case .failure(let error):
                print(error)
                self.view.networkFail(code: "error")
            }
        }
    }
    
    // 예약 취소 업데이트 하기
    func calcleReservation(param: String) {
        Alamofire.request("\(profileURL)?\(param)", method: .post, parameters: nil, headers: nil).responseJSON { res in
            switch res.result{
            case .success(let item):
                self.view.networkSuc(resultdata: item, code: "cancels", tag: 10)
                break
            case .failure(let error):
                print(error)
                self.view.networkFail(code: "cancel Error")
                break;
            }
        }
        
    }
    
    // 노래방 정보 만들어오기
    func getSingingRoom() {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/kara")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    self.view.networkSuc(resultdata: item, code: "sing", tag: 10)
                    break
                case .failure(let error):
                    self.view.networkFail(code: "sing")
                    print(error)
                    break
                }
        }
    }
    
    // 노래방 정보 업데이트 하기
    func giveSingingRoom(param: String, tag: Int) {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/kara?\(param)")
        Alamofire.request(url!, method: .post, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    print("success")
                    if let tf = item as? Bool {
                        if tf {
                            self.view.networkSuc(resultdata: item, code: "reservationSuccess", tag: tag)
                        }
                        else {
                            self.view.networkSuc(resultdata: item, code: "reservationFail", tag: tag)
                        }
                    }
                    break
                case .failure(let error):
                    print("error")
                    self.view.networkFail(code: "givesing")
                    break
                }
        }
    }
    
    // PS4 정보 가져오기
    func getPlaystation() {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/ps4")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    self.view.networkSuc(resultdata: item, code: "playstation", tag: 10)
                    break
                case .failure(let error):
                    self.view.networkFail(code: "playstation")
                    print(error)
                    break
                }
        }
    }
    // PS4 정보 업데이트하기
    func givePlaystation(param: String, tag: Int) {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/ps4?\(param)")
        Alamofire.request(url!, method: .post, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    print("success")
                    if let tf = item as? Bool {
                        if tf {
                            self.view.networkSuc(resultdata: item, code: "PSreservationSuccess", tag: tag)
                        }
                        else {
                            self.view.networkSuc(resultdata: item, code: "PSreservationFail", tag: tag)
                        }
                    }
                    break
                case .failure(let error):
                    print("error")
                    self.view.networkFail(code: "PSreservationFail")
                    break
                }
        }
    }
    
    func getRentalInfo() {
        let url = URL.init(string: "https://playground-e61bc.firebaseapp.com/rent")
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil).responseJSON
            { res in
                switch res.result {
                case .success(let item):
                    self.view.networkSuc(resultdata: item, code: "rental", tag: 10)
                    break
                case .failure(let error):
                    self.view.networkFail(code: "rental")
                    print(error)
                    break
                }
        }
    }
}

