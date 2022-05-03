//
//  FightViewController.swift
//  HACKER
//
//  Created by Yi Joon Choi on 2022/05/04.
//

import UIKit
import SnapKit
import Then

class FightViewController: UIViewController {
  
  // MARK: - Components
  
  private let navigationBar = HackerNavigationBar()
  
  private let dividerLine = UIImageView().then {
    $0.image = UIImage(named: "sectionLine")
    $0.contentMode = .scaleToFill
  }
  
  private lazy var fightTableView = UITableView(frame: .zero, style: .grouped).then {
//      $0.dataSource = self
//      $0.delegate = self
      $0.backgroundColor = .hackerWhite
      $0.separatorStyle = .none
      $0.register(FightTableViewCell.self, forCellReuseIdentifier: FightTableViewCell.identifier)
      
      if #available(iOS 15, *) {
          $0.sectionHeaderTopPadding = 0
      }
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
    view.addSubviews([navigationBar, dividerLine])
    navigationBar.iconLayout(isBack: false,
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
  }
  
  // MARK: - @objc
  
  @objc func infoButtonClicked(_ sender: UIButton) {
    print("info clicked")
  }

}
