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
  
  private let navigationBar = HackerNavigationBar()
  
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
  
  var teamIcon = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    $0.image = UIImage(named: "teamCharacterImage")
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
    $0.addTarget(self, action: #selector(touchAttackButton(_:)), for: .touchUpInside)
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
    $0.backgroundColor = .blue
    $0.separatorStyle = .none
    $0.sectionFooterHeight = 0
    $0.rowHeight = UITableView.automaticDimension
    $0.estimatedRowHeight = 62
    $0.isScrollEnabled = false
    $0.register(LogTableViewCell.self, forCellReuseIdentifier: LogTableViewCell.identifier)
    if #available(iOS 15, *) {
      $0.sectionHeaderTopPadding = 0
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    setupAutoLayout()
    collectionViewRegister()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func collectionViewRegister() {
    memberCollectionView.delegate = self
    memberCollectionView.dataSource = self
    memberCollectionView.register(MemberCollectionViewCell.self, forCellWithReuseIdentifier: MemberCollectionViewCell.identifier)
  }
  
  private func setupAutoLayout() {
    view.addSubviews([teamScrollView, navigationBar, dividerLine])
    teamScrollView.add(teamScrollContainerView)
    teamInfoContainerView.addSubviews([teamIcon, nameLabel,
                                       commitLabel, attackButton, attackButtonCountLabel])
    teamScrollContainerView.addSubviews([faceImage, teamInfoContainerView,
                                         memberLabel, memberCollectionView,
                                         logLabel, logTableView])
    navigationBar.iconLayout(isBack: true,
                             logoImage: UIImage(named: "fightMainIcon"),
                             rightImage: UIImage(named: "infoIconBlack"))
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
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
    teamInfoContainerView.snp.makeConstraints { make in
      make.top.equalTo(faceImage.snp.bottom)
      make.leading.equalToSuperview().inset(97)
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
    }
    commitLabel.snp.makeConstraints { make in
      make.top.equalTo(teamIcon.snp.bottom).offset(8)
      make.centerX.equalToSuperview()
    }
    attackButton.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
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
      make.leading.equalToSuperview().inset(24)
      make.trailing.equalToSuperview()
      make.height.equalTo(140)
    }
    logLabel.snp.makeConstraints { make in
      make.top.equalTo(memberCollectionView.snp.bottom).offset(20)
      make.leading.equalToSuperview().inset(24)
    }
    logTableView.snp.makeConstraints { make in
      make.top.equalTo(logLabel.snp.bottom).offset(16)
      make.centerX.equalToSuperview()
      make.leading.equalToSuperview().inset(23)
      make.bottom.equalToSuperview()
      make.height.equalTo(500)
//      print("height", logTableView.contentSize.height)
    }
  }
  
  // MARK: - @objc
  
  @objc func touchAttackButton(_ sender: UIButton) {
    print("touchAttackButton")
  }
  
}

// MARK: - UICollectionViewDelegate
extension TeamViewController: UICollectionViewDelegate {
  
}

// MARK: - UICollectionViewDataSource
extension TeamViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let memberCell = collectionView.dequeueReusableCell(withReuseIdentifier: MemberCollectionViewCell.identifier, for: indexPath) as? MemberCollectionViewCell else {return UICollectionViewCell() }
    memberCell.awakeFromNib()
    return memberCell
  }
}
extension TeamViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 101, height: collectionView.frame.height)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
}

// MARK: - UITableViewDataSource
extension TeamViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 6
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: LogTableViewCell.identifier) as? LogTableViewCell else { return UITableViewCell() }
    
    cell.backgroundColor = .hackerWhite
    cell.selectionStyle = .none
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    // TODO: 각 셀을 클릭하면 해당 뷰컨으로 push 해주기
    print(indexPath.section)
  }
}

// MARK: - UITableViewDelegate
extension TeamViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = FightTableViewHeader()
    headerView.setIngLabel(text: "2022.01.23")
    return headerView
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
   return 20
  }
}
