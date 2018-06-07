//
//  PlaystationViewController.swift
//  INULand
//
//  Created by Cho on 2018. 6. 6..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class PlaystationViewController: UIViewController {
    
    @IBOutlet weak var topView: UIImageView!
    @IBOutlet weak var playstationCollectionView: UICollectionView!
    @IBOutlet weak var loadingview: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    var isSuccess: Bool = false
    
    var rooms: [SingingRoom] = [] {
        didSet {
            if self.playstationCollectionView != nil{
                self.playstationCollectionView.reloadData()
            }
        }
    }
    
    let times: [String] = ["09", "10", "11", "12", "13", "14", "15", "16"]
    let status: [String] = ["예약불가", "예약가능"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topView.image = #imageLiteral(resourceName: "group")
        let model = NetworkModel(self)
        model.getPlaystation()
        startLoading()
        collectionViewInitialize()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        startLoading()
        self.isSuccess = false
        self.rooms.removeAll()
        let model = NetworkModel(self)
        model.getPlaystation()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

//CollectionView
extension PlaystationViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = playstationCollectionView.dequeueReusableCell(withReuseIdentifier: "PlaystationCollectionCell", for: indexPath) as! PlaystationCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true;
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
        
        cell.timeLabel.text = times[indexPath.row] + ":00"
        
        cell.roomOneButton.layer.cornerRadius = 5
        cell.roomOneButton.clipsToBounds = true
        cell.roomTwoButton.layer.cornerRadius = 5
        cell.roomTwoButton.clipsToBounds = true
        cell.roomThreeButton.layer.cornerRadius = 5
        cell.roomThreeButton.clipsToBounds = true
        cell.roomFourButton.layer.cornerRadius = 5
        cell.roomFourButton.clipsToBounds = true
        
        cell.roomOneButton.tag = indexPath.row
        cell.roomTwoButton.tag = indexPath.row
        cell.roomThreeButton.tag = indexPath.row
        cell.roomFourButton.tag = indexPath.row
        
        cell.roomOneButton.addTarget(self, action: #selector(roomOneClicked(sender:)), for: .touchUpInside)
        cell.roomTwoButton.addTarget(self, action: #selector(roomTwoClicked(sender:)), for: .touchUpInside)
        cell.roomThreeButton.addTarget(self, action: #selector(roomThreeClicked(sender:)), for: .touchUpInside)
        cell.roomFourButton.addTarget(self, action: #selector(roomFourClicked(sender:)), for: .touchUpInside)
        
        cell.roomOneButton.layer.sublayers?.removeAll()
        cell.roomTwoButton.layer.sublayers?.removeAll()
        cell.roomThreeButton.layer.sublayers?.removeAll()
        cell.roomFourButton.layer.sublayers?.removeAll()
        
        let cellOneGradient = CAGradientLayer()
        
        cellOneGradient.frame = cell.roomOneButton.bounds
        cellOneGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellOneGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellOneGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        let cellTwoGradient = CAGradientLayer()
        
        cellTwoGradient.frame = cell.roomOneButton.bounds
        cellTwoGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellTwoGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellTwoGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        let cellThreeGradient = CAGradientLayer()
        
        cellThreeGradient.frame = cell.roomOneButton.bounds
        cellThreeGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellThreeGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellThreeGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        let cellFourGradient = CAGradientLayer()
        
        cellFourGradient.frame = cell.roomOneButton.bounds
        cellFourGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        cellFourGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        cellFourGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        
        if isSuccess {
            if rooms[indexPath.row].isReserved == 0 {
                cell.roomOneLabel.text = status[0]
                cell.roomOneButton.isEnabled = false
            }
            else if rooms[indexPath.row].isReserved == 1 {
                cell.roomOneButton.layer.insertSublayer(cellOneGradient, at: 1)
                cell.roomOneButton.isEnabled = true
                cell.roomOneLabel.text = status[1]
            }
            if rooms[indexPath.row + 8].isReserved == 0 {
                cell.roomTwoLabel.text = status[0]
                cell.roomTwoButton.isEnabled = false
            }
            else if rooms[indexPath.row + 8].isReserved == 1 {
                cell.roomTwoButton.layer.insertSublayer(cellTwoGradient, at: 1)
                cell.roomTwoButton.isEnabled = true
                cell.roomTwoLabel.text = status[1]
            }
            if rooms[indexPath.row + 16].isReserved == 0 {
                cell.roomThreeLabel.text = status[0]
                cell.roomThreeButton.isEnabled = false
            }
            else if rooms[indexPath.row + 16].isReserved == 1 {
                cell.roomThreeButton.layer.insertSublayer(cellThreeGradient, at: 1)
                cell.roomThreeButton.isEnabled = true
                cell.roomThreeLabel.text = status[1]
            }
            if rooms[indexPath.row + 24].isReserved == 0 {
                cell.roomFourLabel.text = status[0]
                cell.roomFourButton.isEnabled = false
            }
            else if rooms[indexPath.row + 24].isReserved == 1 {
                cell.roomFourButton.layer.insertSublayer(cellFourGradient, at: 1)
                cell.roomFourButton.isEnabled = true
                cell.roomFourLabel.text = status[1]
            }
        }
        
        return cell
    }
    
}

//Network
extension PlaystationViewController: NetworkCallback {
    func networkSuc(resultdata: Any, code: String, tag: Int) {
        if code == "playstation" {
            print(resultdata)
            var temp: [SingingRoom] = []
            if let items = resultdata as? [NSDictionary] {
                for item in items {
                    let num = item["name"] as? String ?? ""
                    let isReserved = item["reserved"] as? Int ?? 3
                    //                    var num = 1
                    //                    let isReserved = item["\(num)"] as? Int ?? 3
                    
                    let obj = SingingRoom.init(num: num, isReserved: isReserved)
                    //                    num += 1
                    temp.append(obj)
                }
            }
            self.rooms = temp
            print(self.rooms.count)
            self.isSuccess = true
            self.endLoading()
        }
        if code == "PSreservationSuccess" {
            self.view.makeToast("예약이 완료되었습니다")
            self.appDelegate.profileInfo?.reserved = 2
            self.appDelegate.profileInfo?.resTime = self.times[tag]+":00"
            self.appDelegate.profileInfo?.roomTime = self.times[tag]+"00"
            self.rooms.removeAll()
            self.isSuccess = false
            let model = NetworkModel(self)
            model.getPlaystation()
            
        }
        if code == "PSreservationFail" {
            self.view.makeToast("이미 예약된 자리입니다")
            self.rooms.removeAll()
            self.isSuccess = false
            let model = NetworkModel(self)
            model.getPlaystation()
        }
    }
    
    func networkFail(code: String) {
        if code == "playstation" {
            print("실패하였습니다.")
            self.rooms.removeAll()
            self.isSuccess = false
            let model = NetworkModel(self)
            model.getSingingRoom()
        }
        
    }
}

//Functions
extension PlaystationViewController {
    
    func collectionViewInitialize() {
        self.playstationCollectionView.dataSource = self
        self.playstationCollectionView.delegate = self
        self.playstationCollectionView.register(UINib(nibName:"PlaystationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaystationCollectionCell")
    }
    
    @objc func roomOneClicked(sender: UIButton) {
        if appDelegate.profileInfo?.reserved! == 0 {
            let alertController = UIAlertController(title: "예약하시겠습니까?",message: "PS4 / 예약시간 \(self.times[sender.tag]):00", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let okAction = UIAlertAction(title: "예약", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                let param = "stdId=201301484&roomNum=\(self.rooms[sender.tag].roomNum!)&roomTime=\(self.times[sender.tag])00&resTime=\(self.times[sender.tag]):00"
                let cell = self.playstationCollectionView.cellForItem(at: [0,sender.tag]) as! PlaystationCollectionViewCell
                cell.roomOneButton.layer.sublayers?.removeAll()
                cell.roomOneLabel.text = self.status[0]
                cell.roomOneButton.isEnabled = false
                let model = NetworkModel(self)
                model.givePlaystation(param: param, tag: sender.tag)
                self.startLoading()
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "이미 예약된 이력이 있습니다",message: "한 사람당 하나의 예약만 가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    @objc func roomTwoClicked(sender: UIButton) {
        if appDelegate.profileInfo?.reserved! == 0 {
            let alertController = UIAlertController(title: "예약하시겠습니까?",message: "PS4 / 예약시간 \(self.times[sender.tag]):00", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let okAction = UIAlertAction(title: "예약", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                let param = "stdId=201301484&roomNum=\(self.rooms[sender.tag + 8].roomNum!)&roomTime=\(self.times[sender.tag])00_2&resTime=\(self.times[sender.tag]):00"
                let cell = self.playstationCollectionView.cellForItem(at: [0,sender.tag]) as! PlaystationCollectionViewCell
                cell.roomTwoButton.layer.sublayers?.removeAll()
                cell.roomTwoLabel.text = self.status[0]
                cell.roomTwoButton.isEnabled = false
                let model = NetworkModel(self)
                model.givePlaystation(param: param, tag: sender.tag)
                self.startLoading()
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "이미 예약된 이력이 있습니다",message: "한 사람당 하나의 예약만 가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    @objc func roomThreeClicked(sender: UIButton) {
        if appDelegate.profileInfo?.reserved! == 0 {
            let alertController = UIAlertController(title: "예약하시겠습니까?",message: "PS4 / 예약시간 \(self.times[sender.tag]):00", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let okAction = UIAlertAction(title: "예약", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                let param = "stdId=201301484&roomNum=\(self.rooms[sender.tag + 16].roomNum!)&roomTime=\(self.times[sender.tag])00_3&resTime=\(self.times[sender.tag]):00"
                let cell = self.playstationCollectionView.cellForItem(at: [0,sender.tag]) as! PlaystationCollectionViewCell
                cell.roomThreeButton.layer.sublayers?.removeAll()
                cell.roomThreeLabel.text = self.status[0]
                cell.roomThreeButton.isEnabled = false
                let model = NetworkModel(self)
                model.givePlaystation(param: param, tag: sender.tag)
                self.startLoading()
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "이미 예약된 이력이 있습니다",message: "한 사람당 하나의 예약만 가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    @objc func roomFourClicked(sender: UIButton) {
        if appDelegate.profileInfo?.reserved! == 0 {
            let alertController = UIAlertController(title: "예약하시겠습니까?",message: "PS4 / 예약시간 \(self.times[sender.tag]):00", preferredStyle: UIAlertControllerStyle.alert)
            
            //UIAlertActionStye.destructive 지정 글꼴 색상 변경
            let okAction = UIAlertAction(title: "예약", style: UIAlertActionStyle.destructive){ (action: UIAlertAction) in
                let param = "stdId=201301484&roomNum=\(self.rooms[sender.tag + 24].roomNum!)&roomTime=\(self.times[sender.tag])00_4&resTime=\(self.times[sender.tag]):00"
                let cell = self.playstationCollectionView.cellForItem(at: [0,sender.tag]) as! PlaystationCollectionViewCell
                cell.roomFourButton.layer.sublayers?.removeAll()
                cell.roomFourLabel.text = self.status[0]
                cell.roomFourButton.isEnabled = false
                let model = NetworkModel(self)
                model.givePlaystation(param: param, tag: sender.tag)
                self.startLoading()
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
        else {
            let alertController = UIAlertController(title: "이미 예약된 이력이 있습니다",message: "한 사람당 하나의 예약만 가능합니다.", preferredStyle: UIAlertControllerStyle.alert)
            
            let cancelButton = UIAlertAction(title: "확인", style: UIAlertActionStyle.cancel, handler: nil)
            
            alertController.addAction(cancelButton)
            self.present(alertController,animated: true,completion: nil)
        }
    }
    
    func startLoading() {
        self.loadingview.isHidden = false
        self.loadingIndicator.isHidden = false
        self.loadingIndicator.startAnimating()
    }
    
    func endLoading() {
        self.loadingview.isHidden = true
        self.loadingIndicator.isHidden = true
        self.loadingIndicator.stopAnimating()
    }
}
