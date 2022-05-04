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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configUI()
    setupAutoLayout()
  }
  
  // MARK: - Custom Method
  
  private func configUI() {
    self.view.backgroundColor = .hackerWhite
    self.navigationController?.navigationBar.isHidden = true
  }
  
  private func setupAutoLayout() {
    view.addSubviews([teamScrollView, navigationBar, dividerLine])
    teamScrollView.add(teamScrollContainerView)
    teamScrollContainerView.addSubviews([faceImage, teamInfoContainerView, memberLabel])
    teamInfoContainerView.addSubviews([teamIcon, nameLabel,
                                       commitLabel, attackButton, attackButtonCountLabel])
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
      make.bottom.equalTo(self.teamScrollView.snp.bottom)
      make.width.equalTo(self.view)
      make.height.equalTo(self.teamScrollView.snp.height).priority(250)
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
  }
  
  // MARK: - @objc
  
  @objc func touchAttackButton(_ sender: UIButton) {
    print("touchAttackButton")
  }
  
}
