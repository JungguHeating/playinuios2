import UIKit
import BetterSegmentedControl

class CultureViewController: UIViewController {
    
    @IBOutlet weak var topImage: UIImageView!
    @IBOutlet weak var segmentedControlView: UIView!
    @IBOutlet weak var RoomCollectionView: UICollectionView!
    @IBOutlet weak var DvdCollecionView: UICollectionView!
    
    
    var indexOfSegment: UInt = 1
    
    
    var movieImage:[UIImage] = [#imageLiteral(resourceName: "lalaland"),#imageLiteral(resourceName: "frozen"),#imageLiteral(resourceName: "moana"),#imageLiteral(resourceName: "insideout"),#imageLiteral(resourceName: "tangled"),#imageLiteral(resourceName: "bighero"),#imageLiteral(resourceName: "coco"),#imageLiteral(resourceName: "beauty"),#imageLiteral(resourceName: "zootopia"),#imageLiteral(resourceName: "ralph")]
    var movieTitle: [String] = ["라라랜드", "겨울왕국", "모아나", "인사이드아웃", "라푼젤", "빅 히어로", "코코", "미녀와 야수", "주토피아", "주먹왕랄프"]
    
    var movieSubTitle: [String] = ["La La Land, 2016","Frozen, 2013","Moana, 2016","Inside Out, 2015","Tangled, 2010","Big Hero 6, 2014","Coco, 2017","Beauty and the Beast, 2017","Zootopia, 2016","Wreck-It Ralph, 2012"]
    
    var movieContents: [String] = ["""
황홀한 사랑, 순수한 희망, 격렬한 열정…
이 곳에서 모든 감정이 폭발한다! 꿈을 꾸는 사람들을 위한 별들의 도시 ‘라라랜드’. 재즈 피아니스트 ‘세바스찬’(라이언 고슬링)과 배우 지망생 ‘미아’(엠마 스톤), 인생에서 가장 빛나는 순간 만난 두 사람은 미완성인 서로의 무대를 만들어가기 시작한다.
""","""
얼어붙은 세상을 녹일 자매가 온다! 서로가 최고의 친구였던 자매 ‘엘사’와 ‘안나’. 하지만 언니 ‘엘사’에게는 하나뿐인 동생에게조차 말 못할 비밀이 있다. 모든 것을 얼려버리는 신비로운 힘이 바로 그것. ‘엘사’는 통제할 수 없는 자신의 힘이 두려워 왕국을 떠나고, 얼어버린 왕국의 저주를 풀기 위해 ‘안나’는 언니를 찾아 환상적인 여정을 떠나는데…
""","""
올 겨울 최고의 디즈니 콤비 모아나&마우이. 바다에서 펼쳐지는 황홀한 모험의 신세계!. 모든 것이 완벽했던 모투누이 섬이 저주에 걸리자 바다가 선택한 소녀 모아나는 섬을 구하기 위해 머나먼 항해를 떠난다. 저주를 풀기 위해서는 오직 신이 선택한 전설의 영웅 마우이의 힘이 필요한 상황! 모아나는 마우이를 우여곡절 끝 설득해, 운명적 모험을 함께 떠나는데…
""","""
“괜찮아, 다 잘 될 거야! 우리가 행복하게 만들어 줄게”모든 사람의 머릿속에 존재하는 감정 컨트롤 본부 그곳에서 불철주야 열심히 일하는 기쁨, 슬픔, 버럭, 까칠, 소심 다섯 감정들. 이사 후 새로운 환경에 적응해야 하는 ‘라일리’를 위해 그 어느 때 보다 바쁘게 감정의 신호를 보내지만 우연한 실수로 ‘기쁨’과 ‘슬픔’이 본부를 이탈하게 되자 '라일리’의 마음 속에 큰 변화가 찾아온다. '라일리'가 예전의 모습을 되찾기 위해서는 ‘기쁨’과 ‘슬픔’이 본부로 돌아가야만 한다! 그러나 엄청난 기억들이 저장되어 있는 머릿속 세계에서 본부까지 가는 길은 험난하기만 한데… 과연, ‘라일리’는 다시 행복해질 수 있을까? 지금 당신의 머릿속에서 벌어지는 놀라운 일! 하루에도 몇번씩 변하는 감정의 비밀이 밝혀진다!
""","""
누구도 상상못한 위대한 가출(?)이 시작된다. 올드보이도 못 견뎠을 장장18년을 탑 안에서만 지낸 끈기만점의 소녀 라푼젤. 어느 날 자신의 탑에 침입한 왕국 최고의 대도를 한방에 때려잡는다. 그리고 그를 협박해 꿈에도 그리던 집밖으로의 모험을 단행한다. 과잉보호 모친의 영향으로 세상을 험난한 곳으로만 상상하던 라푼젤. 그런 그녀 앞에 군기 빡 쎈 왕실 경비마 맥시머스의 추격, 라이더에게 복수의 칼날을 가는 스태빙턴 형제의 위협, 라푼젤의 가짜 엄마 고델의 무서운 음모 등이 얽히고 설켜 점점 흥미진진한 사건들이 터지기 시작한다. 그러나 세상물정 깜깜한 우리의 라푼젤은 자신 앞에 펼쳐진 스릴 넘치는 세상을 맘껏 즐기는데...
""","""
치명적인 몸매! 꼭 안아주고 싶은 힐링로봇 ‘베이맥스’가장 사랑스러운 슈퍼히어로가 온다! 천재 공학도 ‘테디’가 개발한 힐링로봇 ‘베이맥스’!‘테디’의 동생이자 로봇 전문가인 ‘히로’는 도시가 파괴될 위기에 처하자‘베이맥스’를 슈퍼히어로로 업그레이드 하는데… 과연 이들은 도시의 위험을 막아낼 수 있을까?
""","""
영원히 기억하고 싶은 황홀한 모험이 시작된다! 뮤지션을 꿈꾸는 소년 미구엘은 전설적인 가수 에르네스토의 기타에 손을 댔다 ‘죽은 자들의 세상’에 들어가게 된다.
 그리고 그곳에서 만난 의문의 사나이 헥터와 함께 상상조차 못했던 모험을 시작하게 되는데…
 과연 ‘죽은 자들의 세상’에 숨겨진 비밀은? 그리고 미구엘은 무사히 현실로 돌아올 수 있을까?
""","""
스크린에 재탄생한 세기의 걸작! 전 세계가 기다려온 가장 아름다운 이야기! 똑똑하고 아름다운 ‘벨(엠마 왓슨)’은 아버지와 살고 있는 작은 마을에서 벗어나 운명적인 사랑과 모험을 꿈꾼다.
 어느 날 행방불명된 아버지를 찾아 폐허가 된 성에 도착한 벨은 저주에 걸린 ‘야수’(댄 스티븐스)를 만나
 아버지 대신 성에 갇히고, 야수 뿐 아니라 성 안의 모든 이들이 신비로운 장미의 마지막 꽃잎이 떨어지기 전에
 저주를 풀지 못하면 영원히 인간으로 돌아올 수 없는 운명임을 알게 된다.
""","""
누구나 살고 싶은 도시 1위, 주토피아
 연쇄 실종 사건 발생!
 “미치도록 잡고 싶었다!”
 교양 있고 세련된 라이프 스타일을 주도하는 도시 주토피아.
 이 곳을 단숨에 혼란에 빠트린 연쇄 실종사건이 발생한다!
 주토피아 최초의 토끼 경찰관 주디 홉스는 48시간 안에 사건 해결을 지시 받자
 뻔뻔한 사기꾼 여우 닉 와일드에게 협동 수사를 제안하는데…
""","""
모든 편견을 ‘부.숴.버.려!’ “직업이 ‘악당’일 뿐, 진짜 ‘나쁜 놈’은 아니야! 8비트 게임 ‘다고쳐 펠릭스’에서 건물을 부수는 악당 주먹왕 랄프. 30년째 매일같이 건물을 부수며 직업에 충실해왔지만, 악당이라는 이유로 누구도 그를 좋아하지 않는다. 모두에게 인정 받는 영웅이 되고 싶은 마음에 급기야 자기 게임을 이탈하여 다른 게임으로 들어가는 랄프! 슈팅게임 ‘히어로즈 듀티’를 거쳐 레이싱 게임 ‘슈가 러시’에 불시착하는 랄프는 과연 게임 세계의 새로운 영웅이 될 수 있을 것인가! 그리고 랄프가 떠난 후 고장 딱지가 붙은 ‘다고쳐 펠릭스’ 게임은 오락실에서 퇴출될 위기를 넘길 수 있을까?
"""]
    // MARK: - Examples
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topImage.image = UIImage(named: "group")
        
        DvdCollecionView.dataSource = self
        DvdCollecionView.delegate = self
        RoomCollectionView.dataSource = self
        RoomCollectionView.delegate = self
        
        
        // Control 5: Adding custom subview to Indicator
        let indicatorControl = BetterSegmentedControl(
            frame: CGRect(x: 0.0, y: 72.0, width: view.bounds.width, height: 57.0),
            titles: ["방 개수", "DVD목록"],
            index: 0, options: [.backgroundColor(.white),
                                .titleColor(.lightGray),
                                .indicatorViewBorderColor(.lightGray),
                                .selectedTitleColor(UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)),
                                .bouncesOnChange(false),
                                .panningDisabled(false)])
        indicatorControl.autoresizingMask = [.flexibleWidth]
        let customSubview = UIView(frame: CGRect(x: 0, y: 45, width: 207, height: 4.0))
        customSubview.backgroundColor = UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)
        customSubview.layer.cornerRadius = 2.0
        customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
        indicatorControl.addTarget(self, action: #selector(CultureViewController.whenSegmentChanged(_:)), for: .valueChanged)
        indicatorControl.addSubviewToIndicator(customSubview)
        view.addSubview(indicatorControl)
    }
    
    @objc func whenSegmentChanged(_ sender: BetterSegmentedControl) {
        for view in self.segmentedControlView.subviews {
            if view.tag == 10 {
                view.removeFromSuperview()
            }
        }
        if sender.index == 0{
            RoomCollectionView.isHidden = false
            DvdCollecionView.isHidden = true
            
        }
        else{
            RoomCollectionView.isHidden = true
            DvdCollecionView.isHidden = false
        }
    }
    // MARK: - Action handlers
    /* @objc func navigationSegmentedControlValueChanged(_ sender: BetterSegmentedControl) {
     if sender.index == 0 {
     print("Turning lights on.")
     view.backgroundColor = .white
     }
     else {
     print("Turning lights off.")
     view.backgroundColor = .darkGray
     }
     }
     */
    /*@IBAction func segmentedControl1ValueChanged(_ sender: BetterSegmentedControl) {
     print("The selected index is \(sender.index) and the title is \(sender.titles[Int(sender.index)])")
     }*/
    
}
/*
 }
 
 }
 
 
 
 extension CultureViewController {
 func initSegmentControl(index: UInt) {
 let indicatorControl = BetterSegmentedControl(
 frame: CGRect(x: 0.0, y: 72.0, width: view.bounds.width, height: 57.0),
 titles: ["방 개수", "DVD목록"],
 index: 0, options: [.backgroundColor(.white),
 .titleColor(.lightGray),
 .indicatorViewBorderColor(.lightGray),
 .selectedTitleColor(UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)),
 .bouncesOnChange(false),
 .panningDisabled(false)])
 indicatorControl.autoresizingMask = [.flexibleWidth]
 let customSubview = UIView(frame: CGRect(x: 0, y: 45, width: 207, height: 4.0))
 customSubview.backgroundColor = UIColor(red:84/255, green:124/255, blue:227/255, alpha:1.00)
 customSubview.layer.cornerRadius = 2.0
 customSubview.autoresizingMask = [.flexibleLeftMargin, .flexibleRightMargin]
 indicatorControl.addTarget(self, action: #selector(CultureViewController.whenSegmentChanged(_:)), for: .valueChanged)
 indicatorControl.tag = 10
 indicatorControl.addSubviewToIndicator(customSubview)
 view.addSubview(indicatorControl)
 }
 @objc func whenSegmentChanged(_ sender: BetterSegmentedControl) {
 for view in self.segmentedControlView.subviews {
 if view.tag == 10 {
 view.removeFromSuperview()
 }
 }
 indexOfSegment = sender.index
 initSegmentControl(index: sender.index)
 collectionView.selectItem(at: [Int(sender.index), 0], animated: true, scrollPosition: .centeredHorizontally)
 }
 
 
 }
 */
extension CultureViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.RoomCollectionView{
            
            return 3
        }
        else{
            return 10
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.RoomCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CultureCollectionViewCell", for: indexPath) as! CultureCollectionViewCell
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
            
            
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
            
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Culture2CollectionViewCell", for: indexPath) as! Culture2CollectionViewCell
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 0.5
            cell.layer.borderColor = UIColor.lightGray.cgColor
            cell.movieImage.image = movieImage[indexPath.row]
            cell.Title.text = movieTitle[indexPath.row]
            cell.subTitle.text = movieSubTitle[indexPath.row]
            cell.contents.text = movieContents[indexPath.row]
            
            
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
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    
    
}

