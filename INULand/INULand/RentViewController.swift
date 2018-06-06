//
//  RentViewController.swift
//  INULand
//
//  Created by 김진우 on 2018. 6. 4..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit

class RentViewController: UIViewController {
    
    @IBOutlet weak var rentCollectionView: UICollectionView!
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var loadingview: UIView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    let rentStuff = ["1인용 자전거", "2인용 자전거", "인라인 스케이트", "킥보드"]
    
    var rentalInfo: RentalInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImage.image = UIImage(named: "group")
        collectionViewInitialize()
        let model = NetworkModel(self)
        model.getRentalInfo()
        startLoading()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let model = NetworkModel(self)
        model.getRentalInfo()
        startLoading()
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

extension RentViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rentStuff.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = rentCollectionView.dequeueReusableCell(withReuseIdentifier: "RentCollectionViewCell", for: indexPath) as! RentCollectionViewCell
        cell.backgroundColor = UIColor.white
        cell.layer.cornerRadius = 5
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = true
        
        cell.layer.shadowColor = UIColor.lightGray.cgColor
        cell.layer.shadowRadius = 1.5
        cell.layer.shadowOffset = CGSize(width: 0, height: 3.0)
        cell.layer.shadowOpacity = 0.4
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
        
        cell.view.layer.cornerRadius = 5
        cell.view.layer.borderWidth = 1.0
        cell.view.layer.borderColor = UIColor.clear.cgColor
        cell.view.layer.masksToBounds = true
        
        /*cell.view.layer.shadowColor = UIColor.lightGray.cgColor
         cell.view.layer.shadowRadius = 1.5
         cell.view.layer.shadowOffset = CGSize(width: 0, height: 3.0)
         cell.view.layer.shadowOpacity = 0.4
         cell.view.layer.masksToBounds = false
         cell.view.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: 5).cgPath
         */
        
        cell.stuffLabel.text = rentStuff[indexPath.row]
        
        if rentalInfo != nil {
            switch indexPath.row {
            case 0:
                let temp: String = String((rentalInfo?.cycle1)!)
                cell.countLabel.text = temp + "개"
            case 1:
                let temp: String = String((rentalInfo?.cycle2)!)
                cell.countLabel.text = temp + "개"
            case 2:
                let temp: String = String((rentalInfo?.inlineSkate)!)
                cell.countLabel.text = temp + "개"
            case 3:
                let temp: String = String((rentalInfo?.kickboard)!)
                cell.countLabel.text = temp + "개"
            default:
                cell.countLabel.text = "0개"
            }
        }
        return cell
        
        
        
    }
}


//Network part
extension RentViewController: NetworkCallback {
    func networkSuc(resultdata: Any, code: String, tag: Int) {
        if code == "rental" {
            print(resultdata)
            if let item = resultdata as? NSDictionary {
                let cycle1 = item["Cycle1"] as? Int ?? -1
                let cycle2 = item["Cycle2"] as? Int ?? -1
                let kickboard = item["KickBoard"] as? Int ?? -1
                let inlineSkate = item["InlineSkate"] as? Int ?? -1
                
                let obj = RentalInfo.init(cycle1: cycle1, cycle2: cycle2, kickboard: kickboard, inlineSkate: inlineSkate)
                self.rentalInfo = obj
                self.rentCollectionView.reloadData()
                endLoading()
            }
        }
    }
    
    func networkFail(code: String) {
        if code == "rental" {
            print("대여물품 정보를 가져오는데 실패하였습니다.")
        }
        
    }
}

//Network end


//Function
extension RentViewController{
    func collectionViewInitialize(){
        self.rentCollectionView.dataSource = self
        self.rentCollectionView.delegate = self
        
        self.rentCollectionView.register(UINib(nibName:"RentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RentCollectionViewCell")
        
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
