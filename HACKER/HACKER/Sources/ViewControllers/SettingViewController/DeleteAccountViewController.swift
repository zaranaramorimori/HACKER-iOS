//
//  DeleteAccountViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/03/28.
//

import UIKit

class DeleteAccountViewController: UIViewController {
  
  // MARK: - Components
  private let navigationBar = HackerNavigationBar()
  
  private let goodbyeLabel = UILabel().then {
    $0.setupLabel(text: "정말\n탈퇴하시겠어요..?\n진챠..? 날 두고..?", color: .hackerBlack, font: .titleBold24)
    $0.numberOfLines = 3
  }
  
  private let cryingManImageView = UIImageView().then {
    $0.image = UIImage(named: "cryingManImage")
  }
  
  private let backButton = UIButton().then {
    $0.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
    $0.setupButton(title: "돌아가기", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
    $0.addTarget(self, action: #selector(touchBackButton(_:)), for: .touchUpInside)
    $0.isUserInteractionEnabled = true
  }
  
  private let deleteAccountButton = UIButton().then {
    $0.setupButton(title: "그래도 탈퇴하기", color: .hackerBlue, font: .btnText(ofSize: 18), backgroundColor: .clear, state: .normal, radius: 0)
    $0.setUnderline()
    $0.addTarget(self, action: #selector(touchDeleteAccountButton(_:)), for: .touchUpInside)
    $0.isUserInteractionEnabled = true
  }
  
  private let tearDropView = UIView().then {
    $0.backgroundColor = .hackerBlue
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
    view.addSubviews([navigationBar, goodbyeLabel,
                      cryingManImageView, tearDropView,
                      deleteAccountButton, backButton])
    navigationBar.iconLayout(logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
    goodbyeLabel.snp.makeConstraints { make in
      make.top.equalTo(self.navigationBar.snp.bottom).offset(9)
      make.leading.equalToSuperview().inset(24)
    }
    cryingManImageView.snp.makeConstraints { make in
      make.centerX.equalToSuperview()
      make.top.equalTo(goodbyeLabel.snp.bottom).offset(97)
    }
    tearDropView.snp.makeConstraints { make in
      make.leading.trailing.bottom.equalToSuperview()
      make.height.equalTo(350)
    }
    UIView.animate(withDuration: 1.5,
                   delay: 0.1,
                   options: .curveEaseInOut,
                   animations: { () -> Void in
      self.tearDropView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 350)
    },
                   completion: { (didFinish) -> Void in
    })
    deleteAccountButton.snp.makeConstraints { make in
      make.bottom.equalTo(self.view.safeAreaLayoutGuide).inset(10)
      make.centerX.equalToSuperview()
    }
    backButton.snp.makeConstraints { make in
      make.bottom.equalTo(self.deleteAccountButton.snp.top).offset(12)
      make.leading.equalToSuperview().inset(24)
      make.centerX.equalToSuperview()
    }
  }
  
  // MARK: - @objc
  
  @objc func touchBackButton(_ sender: UIButton) {
    print("go back")
  }
  
  @objc func touchDeleteAccountButton(_ sender: UIButton) {
    print("deleteAccountButton")
  }
}
