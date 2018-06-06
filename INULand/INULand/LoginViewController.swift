//
//  ViewController.swift
//  INULand
//
//  Created by Cho on 2018. 5. 29..
//  Copyright © 2018년 Cho. All rights reserved.
//

import UIKit
import Toast_Swift
import Alamofire
import SwiftyJSON

class LoginViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    let adminID: String? = "1"
    let adminPass: String? = "1"
    override func viewDidLoad() {
        signInButtonInitialize()
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        idTextField.text = ""
        passTextField.text = ""
        
    }
    
    
    @IBAction func signInButtonClicked(_ sender: Any) {
        if idTextField.text == adminID && passTextField.text == adminPass {

            let point = CGPoint.init(x: (self.view.frame.width / 2) - 5, y: self.view.frame.height - 100)
//            self.view.makeToast("로그인 중...", duration: 2, position: .bottom)
            self.view.makeToast("로그인 중...", point: point, title: nil, image: nil, completion: nil)
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabBar")

            let model = NetworkModel(self)
            model.getProfile()

            let time = DispatchTime.now() + .seconds(2)
            DispatchQueue.main.asyncAfter(deadline: time) {
                self.present(vc!, animated: true, completion: nil)
            }
            

        }else {
            idTextField.text = ""
            passTextField.text = ""
            self.view.makeToast("로그인 실패!", duration: 2, position: .bottom)
        }
    }
    
    
    func signInButtonInitialize() {
        
        signInButton.layer.cornerRadius = signInButton.frame.size.height/2
        signInButton.layer.masksToBounds = true
        
        let buttonGradient = CAGradientLayer()
        buttonGradient.frame = signInButton.bounds
        buttonGradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        buttonGradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        buttonGradient.colors = [UIColor.init(red: 84/255, green: 125/255, blue: 227/255, alpha: 1.0).cgColor, UIColor.init(red: 102/255, green: 144/255, blue: 228/255, alpha: 1.0).cgColor]
        self.signInButton.layer.addSublayer(buttonGradient)
        signInButton.titleLabel?.text = "로그인"
        
    }

}


extension LoginViewController : NetworkCallback {
    
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
    }
    func networkFail(code: String) {
        if(code == "error") {
            print("실패하였습니다.")
            
        }
    }
    
}
