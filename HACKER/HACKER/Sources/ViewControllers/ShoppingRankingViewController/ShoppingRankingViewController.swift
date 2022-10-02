//
//  ShoppingRankingViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

protocol PagingTabbarDelegate {
  func scrollToIndex(to index: Int)
}

// MARK: - ShoppingRankingViewController
class ShoppingRankingViewController: UIViewController {
  
  // MARK: - Components
  let pageLogoImage = UIImageView()
  let infoButton = UIButton()
  let infoView = UIView()
  let infoLabel = UILabel()
  let tabbarCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: [])
    return collectionView
  }()
  let sectionLineImage = UIImageView()
  let pageCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  
  var rankList: RankingResponse?
  var friendList = [SearchFriendResponse]()
  var isToolTipShown: Bool = false
  let screenWidth = UIScreen.main.bounds.width
  var trigger = true
  var checkShopping:Bool = true
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    attribute()
    register()
    layout()
    rankingWithAPI()
  }
  override func viewWillAppear(_ animated: Bool) {
    self.tabBarController?.tabBar.isHidden = false
    searchFriendWithAPI()
  }
  override func viewDidDisappear(_ animated: Bool) {
    NotificationCenter.default.removeObserver(self, name: Notification.Name("friendsListRefresh"), object: nil)
  }
}
// MARK: - Extensions
extension ShoppingRankingViewController {
  func setBackground() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    self.infoView.isHidden = true
  }
  func attribute() {
    self.tabbarCollectionView.delegate = self
    self.tabbarCollectionView.dataSource = self
    self.pageCollectionView.delegate = self
    self.pageCollectionView.dataSource = self
  }
  func register() {
    self.tabbarCollectionView.register(TabbarCollectionViewCell.self, forCellWithReuseIdentifier: TabbarCollectionViewCell.identifier)
    self.pageCollectionView.register(TabbarCollectionViewCell.self, forCellWithReuseIdentifier: TabbarCollectionViewCell.identifier)
    self.pageCollectionView.register(ShoppingCollectionViewCell.self, forCellWithReuseIdentifier: ShoppingCollectionViewCell.identifier)
    self.pageCollectionView.register(RankingCollectionViewCell.self, forCellWithReuseIdentifier: RankingCollectionViewCell.identifier)
    NotificationCenter.default.addObserver(self, selector: #selector(searchFriendWithAPI), name: Notification.Name("friendsListRefresh"), object: nil)
    
  }
  func layout() {
    layoutPageLogoImage()
    layoutInfoButton()
    layoutInfoView()
    layoutInfoLabel()
    layoutTabBarCollectionView()
    layoutSectionLineImage()
    layoutPageCollectionView()
  }
  func layoutPageLogoImage() {
    self.view.add(pageLogoImage) {
      $0.image = UIImage(named: "threemanIcon")
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.view.safeAreaLayoutGuide)
        make.centerX.equalToSuperview()
      }
    }
  }
  func layoutInfoButton() {
    self.view.add(infoButton) {
      $0.setImage(UIImage(named: "infoIconBlack"), for: .normal)
      $0.addTarget(self, action: #selector(self.infoButtonClicked), for: .touchUpInside)
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.view.safeAreaLayoutGuide).offset(11)
        make.trailing.equalToSuperview().offset(-24)
        make.width.equalTo(35)
        make.height.equalTo(34)
      }
    }
  }
  func layoutInfoView() {
    self.view.add(infoView) {
      $0.backgroundColor = .hackerBlack
      $0.setRounded(radius: 15)
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.infoButton.snp.bottom).offset(4)
        make.trailing.equalTo(self.infoButton)
        make.width.equalTo(255)
      }
    }
  }
  func layoutInfoLabel() {
    self.infoView.add(infoLabel) {
      $0.snp.makeConstraints { make in
        make.centerX.centerY.equalToSuperview()
      }
    }
  }
  func layoutTabBarCollectionView() {
    self.view.add(self.tabbarCollectionView) {
      $0.backgroundColor = .white
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.pageLogoImage.snp.bottom)
        make.leading.trailing.equalToSuperview()
        make.width.equalTo(self.screenWidth)
        make.height.equalTo(self.screenWidth * 54/375)
      }
    }
  }
  func layoutSectionLineImage() {
    self.view.add(sectionLineImage) {
      $0.image = UIImage(named: "sectionLine")
      $0.contentMode = .scaleAspectFit
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.tabbarCollectionView.snp.bottom).offset(-6)
        make.centerX.equalToSuperview()
        make.width.equalTo(375)
        make.height.equalTo(15)
      }
    }
  }
  func layoutPageCollectionView() {
    self.view.add(pageCollectionView) {
      $0.backgroundColor = .hackerWhite
      $0.isPagingEnabled = true
      $0.showsHorizontalScrollIndicator = false
      $0.contentInsetAdjustmentBehavior = .never
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.sectionLineImage.snp.bottom)
        make.leading.trailing.bottom.equalToSuperview()
      }
    }
  }
  func shoppingSelected() {
    NotificationCenter.default.post(name: NSNotification.Name("shoppingSelect"), object: nil)
    self.pageCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .left, animated: true)
  }
  func rankingSelected() {
    NotificationCenter.default.post(name: NSNotification.Name("rankingSelect"), object: nil)
    self.pageCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 1) as IndexPath, at: .left, animated: true)
  }
  @objc func infoButtonClicked() {
    // Shopping,Ranking일 때 InfoView 분기처리
    if checkShopping == true {
      self.infoLabel.numberOfLines = 2
      self.infoLabel.setupLabel(text: "랭킹과 머리카락은 00:00시 정각에\n업데이트 됩니다.", color: .hackerWhite, font: .titleBold(ofSize: 16))
      self.infoView.snp.makeConstraints { make in
        make.height.equalTo(72)
      }
    } else {
      self.infoLabel.numberOfLines = 3
      self.infoLabel.setupLabel(text: "랭킹은 매 월마다 초기화 됩니다.\n한 달 동안 누가 가장 많은 커밋 수를\n올렸는지 랭킹에서 확인해보세요.", color: .hackerWhite, font: .titleBold(ofSize: 16))
      self.infoView.snp.makeConstraints { make in
        make.height.equalTo(94)
      }
    }
    // Info버튼 선택 시 뷰 앞으로 보이게
    isToolTipShown = !isToolTipShown
    if isToolTipShown {
      self.infoView.isHidden = false
      self.view.bringSubviewToFront(infoView)
    } else {
      self.infoView.isHidden = true
    }
  }
  // MARK: - Network
  func rankingWithAPI() {
    LoadingHUD.show()
    RankingAPI.shared.totalRanking { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let rankInfo = data as? RankingResponse {
          self.rankList = rankInfo
          print(rankInfo)
          self.pageCollectionView.reloadData()
        }
      case .requestErr(let status):
        print("RankingAPI - requestErr: \(status)")
        
      case .pathErr:
        print("RankingAPI - pathErr")
      case .serverErr:
        print("RankingAPI - serverErr")
      case .networkFail:
        print("RankingAPI - networkFail")
      default:
        print("default!")
      }
    }
  }
  // MARK: - Network
  @objc func searchFriendWithAPI() {
    LoadingHUD.show()
    SearchFriendAPI.shared.searchFriend { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let friendInfo = data as? [SearchFriendResponse] {
          self.friendList = friendInfo
          self.pageCollectionView.reloadData()
        }
      case .requestErr(let status):
        print("SearchFriendAPI - requestErr: \(status)")
        
      case .pathErr:
        print("SearchFriendAPI - pathErr")
      case .serverErr:
        print("SearchFriendAPI - serverErr")
      case .networkFail:
        print("SearchFriendAPI - networkFail")
      default:
        print("SearchFriendAPI - default (.loginSuccess)")
      }
    }
  }
}
// MARK: - CollectionViewDelegate FlowLayout
extension ShoppingRankingViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    switch collectionView {
    case self.tabbarCollectionView :
      return CGSize(width: self.screenWidth/2, height: collectionView.frame.height)
    case self.pageCollectionView :
      return CGSize(width: self.screenWidth, height: collectionView.frame.height)
    default :
      return CGSize(width: 0, height: 0)
    }
  }
  // 왼쪽, 오른쪽으로 스와이프 시
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    let currentIndex = Int(scrollView.contentOffset.x / scrollView.frame.width)
    
    switch currentIndex {
    case 0 :
      self.trigger = true
      self.tabbarCollectionView.reloadData()
      self.shoppingSelected()
    case 1 :
      self.trigger = false
      self.tabbarCollectionView.reloadData()
      self.rankingSelected()
    default : break
    }
  }
}
// MARK: - CollectionViewDataSource
extension ShoppingRankingViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    switch collectionView {
    case self.tabbarCollectionView : return 1
    case self.pageCollectionView : return 2
    default : return 0
    }
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if collectionView == pageCollectionView {
      return 1
    }
    return 2
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    switch collectionView {
      // TabBarCollectionView 일 때
    case self.tabbarCollectionView :
      guard let tabBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabbarCollectionViewCell.identifier, for: indexPath) as? TabbarCollectionViewCell else { return UICollectionViewCell() }
      tabBarCell.awakeFromNib()
      if trigger == true { // 구경하기 탭 선택되었을 때
        if indexPath.item == 0 { // 구경하기 블랙
          pageLogoImage.image = UIImage(named: "threemanIcon")
          tabBarCell.updateLabel(name: "구경하기", color: .hackerBlack)
        } else { // 랭킹 회색
          tabBarCell.updateLabel(name: "랭킹", color: .hackerDarkGray)
        }
      } else { // 랭킹 탭 선택되었을 때
        if indexPath.item == 0 { // 구경하기 회색
          pageLogoImage.image = UIImage(named: "rankingIcon")
          tabBarCell.updateLabel(name: "구경하기", color: .hackerDarkGray)
        } else { // 랭킹 블랙
          tabBarCell.updateLabel(name: "랭킹", color: .hackerBlack)
        }
      }
      return tabBarCell
      // 페이지 컬렉션뷰 일 때
    case self.pageCollectionView :
      if indexPath.section == 0 {
        guard let shoppingCell = collectionView.dequeueReusableCell(withReuseIdentifier: ShoppingCollectionViewCell.identifier, for: indexPath) as? ShoppingCollectionViewCell else { return UICollectionViewCell() }
        shoppingCell.backgroundColor = .hackerWhite
        shoppingCell.friendList = self.friendList
        self.checkShopping = true
        shoppingCell.awakeFromNib()
        return shoppingCell
      } else {
        guard let rankingCell = collectionView.dequeueReusableCell(withReuseIdentifier: RankingCollectionViewCell.identifier, for: indexPath) as? RankingCollectionViewCell else { return UICollectionViewCell() }
        rankingCell.backgroundColor = .hackerWhite
        rankingCell.rankList = self.rankList
        self.checkShopping = false
        rankingCell.awakeFromNib()
        return rankingCell
      }
    default : return UICollectionViewCell()
    }
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    guard let tabBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: TabbarCollectionViewCell.identifier, for: indexPath) as? TabbarCollectionViewCell else { return }
    tabBarCell.awakeFromNib()
    if collectionView == tabbarCollectionView {
      if indexPath.item == 0 {
        trigger = true
        tabbarCollectionView.reloadData()
        self.checkShopping = true
        shoppingSelected()
      }
      if indexPath.item == 1 {
        trigger = false
        tabbarCollectionView.reloadData()
        self.checkShopping = false
        rankingSelected()
      }
    }
  }
}
// MARK: - PagingTabBarDelegate
extension ShoppingRankingViewController: PagingTabbarDelegate {
  func scrollToIndex(to index: Int) {
    pageCollectionView.scrollToItem(at: IndexPath(row: index, section: 0), at: .centeredHorizontally, animated: true)
  }
}
