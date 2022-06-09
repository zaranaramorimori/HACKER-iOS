//
//  TeamViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class TeamViewController: UIViewController {
  
  // MARK: - Components
  
  var serverTeamDetailInfo: TeamDetailResponse?
  var teamId = 0
  
  private let navigationBar = HackerNavigationBar()
  private let memberEmptyView = EmptyView()
  private let logEmptyView = EmptyView()
  
  private let dividerLine = UIImageView().then {
    $0.image = UIImage(named: "sectionLine")
    $0.contentMode = .scaleToFill
  }
  
  private let teamScrollView = UIScrollView().then {
    $0.backgroundColor = .hackerWhite
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.showsVerticalScrollIndicator = false
    $0.isScrollEnabled = true
  }
  
  private let teamScrollContainerView = UIView().then {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleToFill
  }
  
  var faceImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "teamCharacterImage")
  }
  
  var hairImage = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  
  var teamIcon = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "teamCharacterImage")
    $0.layer.cornerRadius = 10
  }
  
  var nameLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .titleBold(ofSize: 24)
    $0.text = "FILL-IN"
  }
  
  var commitLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleRegular(ofSize: 18)
    $0.text = "1,500 커밋  /  360가닥"
  }
  
  private let attackButton = UIButton().then {
    $0.titleLabel?.font = .btnText(ofSize: 32)
    $0.setBackgroundImage(UIImage(named: "yesButtonActive"), for: .normal)
    $0.setTitle("공격하기", for: .normal)
    $0.setTitleColor(.hackerWhite, for: .normal)
    $0.addTarget(self, action: #selector(touchAttackButton), for: .touchUpInside)
  }
  
  var attackButtonCountLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .btnText(ofSize: 32)
    $0.text = "X14"
  }
  
  private let teamInfoContainerView = UIView().then {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.contentMode = .scaleToFill
  }
  
  private let memberLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 20)
    $0.text = "멤버"
  }
  
  private let memberCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .hackerWhite
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 12)
    return collectionView
  }()
  
  private let logLabel = UILabel().then {
    $0.textColor = .hackerBlack
    $0.font = .subtitleMedium(ofSize: 20)
    $0.text = "로그"
  }
  
  private lazy var logTableView = UITableView(frame: .zero, style: .grouped).then {
    $0.dataSource = self
    $0.delegate = self
    $0.backgroundColor = .hackerWhite
    $0.separatorStyle = .none
    $0.sectionFooterHeight = 0
    $0.rowHeight = UITableView.automaticDimension
    $0.estimatedRowHeight = 62
    $0.contentInset = UIEdgeInsets(top: -20, left: 0, bottom: 0, right: 0)
    $0.isScrollEnabled = false
    $0.register(LogTableViewCell.self, forCellReuseIdentifier: LogTableViewCell.identifier)
    if #available(iOS 15, *) {
      $0.sectionHeaderTopPadding = 0
    }
  }
  
  private let notificationView = UIView().then {
    $0.backgroundColor = .hackerBlack
    $0.layer.cornerRadius = 15
  }
  
  private let notificationViewLabel = UILabel().then {
    $0.setupLabel(text: "랭킹과 머리카락은 00:00시 정각에\n업데이트 됩니다.", color: .hackerWhite, font: .titleBold(ofSize: 16))
    $0.numberOfLines = 2
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAutoLayout()
    collectionViewRegister()
    updateTeamDetail()
    updateEmptyViewLabel()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    configUI()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
    notificationView.isHidden = true
    self.tabBarController?.tabBar.isTranslucent = false
    self.tabBarController?.tabBar.isHidden = false
  }
  
  private func collectionViewRegister() {
    memberCollectionView.delegate = self
    memberCollectionView.dataSource = self
    memberCollectionView.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: MemberCollectionViewCell.identifier)
  }
  
  private func setupAutoLayout() {
    view.addSubviews([teamScrollView, navigationBar, dividerLine, notificationView])
    notificationView.add(notificationViewLabel)
    teamScrollView.add(teamScrollContainerView)
    teamInfoContainerView.addSubviews([teamIcon, nameLabel,
                                       commitLabel, attackButton, attackButtonCountLabel])
    teamScrollContainerView.addSubviews([faceImage, hairImage, teamInfoContainerView,
                                         memberLabel, memberCollectionView, memberEmptyView,
                                         logLabel, logTableView, logEmptyView])
    navigationBar.iconLayout(isBack: true,
                             logoImage: UIImage(named: "fightMainIcon"),
                             rightImage: UIImage(named: "infoIconBlack"))
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.hideNotificationView = {
      self.notificationView.isHidden = !self.navigationBar.rightButton.isSelected
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    dividerLine.snp.makeConstraints { make in
      make.top.equalTo(navigationBar.snp.bottom)
      make.leading.trailing.equalToSuperview()
    }
    teamScrollView.snp.makeConstraints { make in
      make.top.equalTo(dividerLine.snp.bottom)
      make.centerX.leading.trailing.equalToSuperview()
      make.bottom.equalTo(self.view.safeAreaLayoutGuide)
    }
    teamScrollContainerView.snp.makeConstraints { make in
      make.centerX.top.leading.equalToSuperview()
      make.bottom.equalTo(teamScrollView.snp.bottom)
      make.width.equalTo(self.view)
      make.height.equalTo(teamScrollView.snp.height).priority(250)
    }
    faceImage.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(47)
      make.centerX.equalToSuperview()
      make.height.width.equalTo(197)
    }
    hairImage.snp.makeConstraints { make in
      make.edges.equalTo(faceImage)
    }
    teamInfoContainerView.snp.makeConstraints { make in
      make.top.equalTo(faceImage.snp.bottom)
      make.centerX.equalToSuperview()
      make.height.equalTo(190)
    }
    teamIcon.snp.makeConstraints { make in
      make.top.equalToSuperview().inset(35)
      make.leading.equalToSuperview().inset(12)
      make.height.width.equalTo(49)
    }
    nameLabel.snp.makeConstraints { make in
      make.centerY.equalTo(teamIcon)
      make.leading.equalTo(teamIcon.snp.trailing).offset(20)
      make.trailing.equalToSuperview()
    }
    commitLabel.snp.makeConstraints { make in
      make.top.equalTo(teamIcon.snp.bottom).offset(8)
      make.centerX.equalToSuperview()
    }
    attackButton.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.centerX.equalToSuperview()
      make.width.equalTo(181)
    }
    attackButtonCountLabel.snp.makeConstraints { make in
      make.leading.equalTo(attackButton.snp.trailing).offset(12)
      make.centerY.equalTo(attackButton)
    }
    memberLabel.snp.makeConstraints { make in
      make.top.equalTo(teamInfoContainerView.snp.bottom).offset(25)
      make.leading.equalToSuperview().inset(24)
    }
    memberCollectionView.snp.makeConstraints { make in
      make.top.equalTo(memberLabel.snp.bottom).offset(12)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(140)
    }
    memberEmptyView.snp.makeConstraints { make in
      make.top.equalTo(memberLabel.snp.bottom).offset(12)
      make.leading.trailing.equalToSuperview()
      make.height.equalTo(113)
    }
    memberEmptyView.logoImage.snp.makeConstraints { make in
      make.width.height.equalTo(66)
    }
    logLabel.snp.makeConstraints { make in
      make.top.equalTo(memberCollectionView.snp.bottom).offset(20)
      make.leading.equalToSuperview().inset(24)
    }
    logTableView.snp.makeConstraints { make in
      make.top.equalTo(logLabel.snp.bottom).offset(16)
      make.centerX.equalToSuperview()
      make.leading.equalToSuperview().inset(23)
      logTableView.layoutIfNeeded()
      make.height.equalTo(logTableView.contentSize.height + 130)
      make.bottom.equalToSuperview().priority(.high)
    }
    logEmptyView.snp.makeConstraints { make in
      make.top.equalTo(logLabel.snp.bottom).offset(12)
      make.leading.trailing.equalToSuperview()
      make.bottom.equalToSuperview().inset(36).priority(.low)
      make.height.equalTo(177)
    }
    logEmptyView.logoImage.snp.makeConstraints { make in
      make.width.height.equalTo(66)
    }
    notificationView.snp.makeConstraints { make in
      make.top.equalTo(navigationBar.rightButton.snp.bottom).offset(4)
      make.trailing.equalToSuperview().inset(24)
      make.width.equalTo(265)
      make.height.equalTo(72)
    }
    
    notificationViewLabel.snp.makeConstraints { make in
      make.centerX.centerY.equalToSuperview()
    }
  }
  
  private func updateTeamDetail() {
    hairImage.updateServerImage(serverTeamDetailInfo?.team.head ?? "")
    teamIcon.updateServerImage(serverTeamDetailInfo?.team.imageURL ?? "")
    nameLabel.text = serverTeamDetailInfo?.team.name
    commitLabel.text = "\(serverTeamDetailInfo?.team.commitCount ?? 0) 커밋  /  \(serverTeamDetailInfo?.team.hairCount ?? 0) 가닥"
    attackButtonCountLabel.text = "X\(serverTeamDetailInfo?.team.couponCount ?? 0)"
  }
  
  private func updateEmptyViewLabel() {
    memberEmptyView.updateLabels(text: "아직 추가된 멤버가 없어요!", aigoSize: 16, nothingSize: 11)
    logEmptyView.updateLabels(text: "아무 소식도 알려드릴게 없어요!", aigoSize: 16, nothingSize: 11)
    
    if let membersCount = serverTeamDetailInfo?.members {
      if !membersCount.isEmpty {
        memberEmptyView.isHidden = true
      }
    }
    
    if let logsCount = serverTeamDetailInfo?.logs {
      if !logsCount.isEmpty {
        logEmptyView.isHidden = true
      }
    }
  }
  
  // MARK: - @objc
  
  @objc func touchAttackButton(_ sender: UIButton) {
    LoadingHUD.show()
    AttackAPI.shared.attackTeam(teamId: teamId) { (response) in
      LoadingHUD.hide()
      switch response {
      case .success:
        let lottieVC = AttackLottieViewController()
        lottieVC.attackType = .attacker
        lottieVC.modalPresentationStyle = .overCurrentContext
        self.present(lottieVC, animated: false)
      case .requestErr(let msg):
        if let errorMsg = msg as? String {
          self.makeAlertOnlyMessage(message: errorMsg, okAction: nil)
        }
      case .pathErr:
        print("attackUser - pathErr")
      case .serverErr:
        print("attackUser - serverErr")
      case .networkFail:
        print("attackUser - networkFail")
      }
    }
  }
  func fetchFriendDetail(userID: Int) {
    LoadingHUD.show()
    ShoppingAPI.shared.friendDetail(userID: userID) { response in
      LoadingHUD.hide()
      switch response {
      case .success(let data):
        if let shoppingInfo = data as? ShoppingResponse {
          let friendDetailVC = FriendDetailViewController()
          friendDetailVC.userNicknameLabel.setupLabel(text: shoppingInfo.user.nickname, color: .hackerBlack, font: .titleBold(ofSize: 24))
          friendDetailVC.userGithubNameLabel.setupLabel(text: shoppingInfo.user.username, color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
          friendDetailVC.hairNumLabel.setupLabel(text: "\(shoppingInfo.user.hairCount)가닥", color: .hackerBlack, font: .btnText(ofSize: 40))
          friendDetailVC.userhairfirstImage.updateServerImage(shoppingInfo.head ?? "")
          friendDetailVC.getuserID = userID
          friendDetailVC.isMyFriend = shoppingInfo.isMyFriend
          self.navigationController?.pushViewController(friendDetailVC, animated: false)
        }
      case .requestErr(let status):
        print("fetchFriendDetail - requestErr: \(status)")
      case .pathErr:
        print("fetchFriendDetail - pathErr")
      case .serverErr:
        print("fetchFriendDetail - serverErr")
      case .networkFail:
        print("fetchFriendDetail - networkFail")
      }
    }
  }
}

// MARK: - UICollectionViewDelegate
extension TeamViewController: UICollectionViewDelegate {
  
}

// MARK: - UICollectionViewDataSource
extension TeamViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return serverTeamDetailInfo?.members.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let memberCell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCollectionViewCell.identifier, for: indexPath) as? MemberCollectionViewCell else {return UICollectionViewCell() }
    memberCell.awakeFromNib()
    memberCell.nameLabel.text = serverTeamDetailInfo?.members[indexPath.row].nickname
    memberCell.hairImage.updateServerImage(serverTeamDetailInfo?.members[indexPath.row].head ?? "")
    return memberCell
  }
}
extension TeamViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 101, height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let selectedMember = serverTeamDetailInfo?.members[indexPath.item],
       let myUsername = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.username) {
      // 내 얼굴 클릭했을 때
      if selectedMember.nickname == myUsername {
        let myDetailVC = MainProfileViewController()
        self.navigationController?.pushViewController(myDetailVC, animated: true)
      } else { // 다른 사람 얼굴 클릭
        self.fetchFriendDetail(userID: selectedMember.userID)
      }
    }
  }
}

// MARK: - UITableViewDataSource
extension TeamViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return serverTeamDetailInfo?.logs[section].content.count ?? 0
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return serverTeamDetailInfo?.logs.count ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: LogTableViewCell.identifier) as? LogTableViewCell else { return UITableViewCell() }
    
    cell.backgroundColor = .hackerWhite
    cell.selectionStyle = .none
    
    cell.logLabel.text = serverTeamDetailInfo?.logs[indexPath.section].content.first
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let data = serverTeamDetailInfo?.logs[indexPath.section].content[indexPath.row] {
      if data.contains("머리카락을 뽑아갔어요!") {
        let lottieVC = AttackLottieViewController()
        lottieVC.attackType = .victim
        lottieVC.modalPresentationStyle = .overCurrentContext
        self.present(lottieVC, animated: false)
      }
    }
  }
}

// MARK: - UITableViewDelegate
extension TeamViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let dateLabel = UILabel()
    dateLabel.frame = CGRect(x: 5, y: 5, width: tableView.frame.width, height: 40)
    dateLabel.setupLabel(text: serverTeamDetailInfo?.logs[section].date ?? "", color: .hackerBlack, font: .titleBold(ofSize: 16))
    
    let headerView = UIView()
    headerView.addSubview(dateLabel)
    
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
}
