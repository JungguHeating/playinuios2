//
//  ProfileViewController.swift
//  INULand
//
//  Created by 동균 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var reservationCellView: UIView!
    @IBOutlet weak var noShowCellView: UIView!
    
    @IBOutlet weak var reservationLocationLabel: UILabel!
    @IBOutlet weak var reservationTimeLabel: UILabel!
    @IBOutlet weak var noReservationLabel: UILabel!
    @IBOutlet weak var reservationCancelButton: UIButton!
    @IBOutlet weak var divisionLine: UIView!
    
    @IBOutlet weak var noShowCountLabel: UILabel!
    
    @IBOutlet weak var profileName: UILabel!
    @IBOutlet weak var profileId: UILabel!
    
    
    var profileInfo:userinfo?
    
    var noshowToInt : Int?
    var userIdToString: String?
    var roomTimeToString: String?
    var reservedToInt: Int?
    
    override func viewDidLoad() {
        
        
        profileInfo = self.appDelegate.profileInfo
        super.viewDidLoad()
        profileName.text = self.appDelegate.profileInfo?.userName
        profileId.text = self.appDelegate.profileInfo?.userId
        
        noshowToInt = profileInfo?.noShow
        noShowCountLabel.text = "\(noshowToInt!)"
        
        collectionViewInitialize()
        isReservedCheck()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        profileInfo = self.appDelegate.profileInfo
        isReservedCheck()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logOutButtonClicked(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func reservationCancleClicked(_ sender: Any) {
        //
        userIdToString = profileInfo?.userId
        roomTimeToString = profileInfo?.roomTime
        reservedToInt = profileInfo?.reserved
        let alertController = UIAlertController(title: "해당 내용을 삭제할까요？",message: "삭제하게 되면 복구가 불가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
        
        //UIAlertActionStye.destructive 지정 글꼴 색상 변경
        let okAction = UIAlertAction(title: "삭제", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
            let param = "stdId=\(self.userIdToString!)&roomTime=\(self.roomTimeToString!)&kindNum=\(self.reservedToInt!)"
            print(param)
            let model = NetworkModel(self)
            model.calcleReservation(param: param)
            
            self.reservationLocationLabel.text = nil
            self.reservationTimeLabel.text = nil
            self.reservationCancelButton.isHidden = true
            self.divisionLine.isHidden = true
            self.reservationCancelButton.isEnabled = false
            self.noReservationLabel.text = "예약된 내용이 없습니다"
            self.appDelegate.profileInfo?.reserved = 0
            self.view.makeToast("예약이 취소되었습니다")
        }
        
        let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelButton)
        
        self.present(alertController,animated: true,completion: nil)
        //
        

        
    }
    
    func isReservedCheck() {
        
        switch self.appDelegate.profileInfo?.reserved {
        case 0?:  // 예약 없음
            reservationLocationLabel.text = nil
            reservationTimeLabel.text = nil
            reservationCancelButton.isHidden = true
            divisionLine.isHidden = true
            reservationCancelButton.isEnabled = false
            break
        case 1?: // 노래방 예약
            reservationLocationLabel.text = "노래방"
            reservationTimeLabel.text = self.appDelegate.profileInfo?.resTime
            reservationCancelButton.isHidden = false
            divisionLine.isHidden = false
            noReservationLabel.text = nil
            reservationCancelButton.isEnabled = true
            break
        case 2?: // 플스방 예약
            reservationLocationLabel.text = "플스방"
            reservationTimeLabel.text = self.appDelegate.profileInfo?.resTime
            reservationCancelButton.isHidden = false
            divisionLine.isHidden = false
            noReservationLabel.text = nil
            reservationCancelButton.isEnabled = true
            break
        default:
            break
        }
    
        
    }
    
    func collectionViewInitialize(){
        reservationCellView.layer.borderWidth = 1.0
        reservationCellView.layer.cornerRadius = 5
        reservationCellView.layer.borderColor = UIColor.clear.cgColor
        reservationCellView.layer.masksToBounds = true;
        
        reservationCellView.layer.shadowColor = UIColor.lightGray.cgColor
        reservationCellView.layer.shadowRadius = 1.5
        reservationCellView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        reservationCellView.layer.shadowOpacity = 0.4
        reservationCellView.layer.masksToBounds = false
        reservationCellView.layer.shadowPath = UIBezierPath(roundedRect: reservationCellView.bounds, cornerRadius: 5).cgPath
        
        noShowCellView.layer.borderWidth = 1.0
        noShowCellView.layer.cornerRadius = 5
        noShowCellView.layer.borderColor = UIColor.clear.cgColor
        noShowCellView.layer.masksToBounds = true;
        
        noShowCellView.layer.shadowColor = UIColor.lightGray.cgColor
        noShowCellView.layer.shadowRadius = 1.5
        noShowCellView.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        noShowCellView.layer.shadowOpacity = 0.4
        noShowCellView.layer.masksToBounds = false
        noShowCellView.layer.shadowPath = UIBezierPath(roundedRect:noShowCellView.bounds, cornerRadius: 5).cgPath
    }
}


extension ProfileViewController : NetworkCallback {
    
    func networkSuc(resultdata: Any, code: String, tag: Int) {
        if code == "Profile" {
            print(resultdata)
            var temp : [userinfo] = []
            if let item = resultdata as? NSDictionary {
                
                let noShow = item["Stu_Noshow"] as? Int ?? 0
                let userName = item["Stu_name"] as? String ?? ""
                let userId = item["Stu_id"] as? String ?? ""
                let reserved = item["Kind_num"] as? Int ?? 0
                let resTime = item["resTime"] as? String ?? ""
                let roomTime = item["roomTime"] as? String ?? ""
                
                let obj = userinfo(Kind_num: reserved, Stu_id: userId, Stu_Noshow: noShow, Stu_name: userName, resTime: resTime, roomTime: roomTime )
                temp.append(obj)
                print(item)
                
                
                self.appDelegate.profileInfo = obj
            }
        }
        else if code == "cancels"{
            print("12345566")
            let model = NetworkModel(self)
            model.getProfile()
            self.view.makeToast("예약이 취소되었습니다")
        }
    }
    func networkFail(code: String) {
        if(code == "error") {
            print("실패하였습니다.")
            let model = NetworkModel(self)
            model.getProfile()
        }
        if(code == "cancel Error)") {
            let param = "stdId=\(self.userIdToString!)&kindNum=\(self.reservedToInt!)"
            let model = NetworkModel(self)
            model.calcleReservation(param: param)
        }
    }
    
}
