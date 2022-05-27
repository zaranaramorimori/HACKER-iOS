//
//  CheckFriendViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/05/08.
//

import UIKit

import SnapKit
import Then

//MARK: - CheckFriendViewController
class CheckFriendViewController: UIViewController {
  
  // MARK: - Properties
  var friendList: [FriendGithubResponse]?
  var prevIndex: IndexPath?
  var checkedIndex: Int?
  
  // MARK: - Components
  private let navigationBar = HackerNavigationBar()
  private let hackerImageView = UIImageView()
  private let helloLabel = UILabel()
  private let explainLabel = UILabel()
  private let addButton = UIButton()
  private let friendCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .hackerWhite
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    return collectionView
  }()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    layout()
    attribute()
  }
}

// MARK: - Extensions
extension CheckFriendViewController {
  func setBackground() {
      self.view.backgroundColor = .hackerWhite
      self.navigationController?.navigationBar.isHidden = true
  }
  func layout() {
    layoutNavigationBar()
    layoutHackerImageView()
    layoutHelloLabel()
    layoutExplainLabel()
    layoutNextButton()
    layoutFriendCV()
  }
  func attribute() {
    friendCollectionView.delegate = self
    friendCollectionView.dataSource = self
    friendCollectionView.register(FriendListCollectionViewCell.self, forCellWithReuseIdentifier: FriendListCollectionViewCell.identifier)
  }
  func layoutNavigationBar() {
    view.addSubview(navigationBar)
    navigationBar.iconLayout(isBack: true, logoImage: nil, rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
  }
  func layoutHackerImageView() {
    self.view.add(hackerImageView) {
      $0.image = UIImage(named: "logoIcon")
      $0.snp.makeConstraints {
        $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(32)
        $0.centerX.equalToSuperview()
        $0.width.equalTo(100)
        $0.height.equalTo(100)
      }
    }
  }
  func layoutHelloLabel() {
    self.view.add(helloLabel) {
      $0.setupLabel(text: "추가하세요!", color: .hackerBlack, font: .titleBold(ofSize: 24))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.hackerImageView.snp.bottom).offset(16)
        $0.centerX.equalToSuperview()
      }
    }
  }
  func layoutExplainLabel() {
    self.view.add(explainLabel) {
      $0.setupLabel(text: "어떤 분을 추가할까요?", color: .hackerBlack, font: .subtitleMedium(ofSize: 16))
      $0.snp.makeConstraints {
        $0.top.equalTo(self.helloLabel.snp.bottom).offset(12)
        $0.centerX.equalToSuperview()
      }
    }
  }
  
  func layoutNextButton() {
    self.view.add(addButton) {
      $0.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      $0.setupButton(title: "추가", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      $0.titleLabel?.textAlignment = .center
      $0.addTextSpacing(10)
      $0.isUserInteractionEnabled = false
      $0.addTarget(self, action: #selector(self.touchAddButton), for: .touchUpInside)
      $0.snp.makeConstraints {
        $0.centerX.equalToSuperview()
        $0.leading.equalToSuperview().offset(24)
        $0.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-19)
      }
    }
  }
  
  func layoutFriendCV() {
    self.view.add(friendCollectionView) {
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.explainLabel.snp.bottom).offset(35)
        make.leading.trailing.equalToSuperview().inset(24)
        make.bottom.equalTo(self.addButton.snp.top).offset(-10)
      }
    }
  }
}

// MARK: - Actions
extension CheckFriendViewController {
  @objc func touchAddButton() {
    if let index = checkedIndex {
      let popupVC = CheckAddUserPopUpViewController()
      popupVC.friendId = friendList?[index].id
      popupVC.username = friendList?[index].username
      popupVC.parentVC = self
      popupVC.modalPresentationStyle = .overFullScreen
      self.present(popupVC, animated: false, completion: nil)
    }
  }
}

// MARK: - UICollectionViewDataSource
extension CheckFriendViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return friendList?.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendListCollectionViewCell.identifier, for: indexPath) as? FriendListCollectionViewCell else {return UICollectionViewCell() }
    
    cell.currentFriendData = friendList?[indexPath.item]
    
    if let index = checkedIndex {
      if indexPath.item == index {
        cell.isChecked = true
      } else {
        cell.isChecked = false
      }
    }
    
    cell.awakeFromNib()
    
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CheckFriendViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 100)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 8
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    collectionView.deselectItem(at: indexPath, animated: false)
    
    // 셀 체크박스 변경 로직
    guard let data = friendList?[indexPath.item] else { return }
    if !data.isFriend {
      checkedIndex = indexPath.item
      if let prev = prevIndex {
          collectionView.reloadItems(at: [prev, indexPath])
      } else {
          collectionView.reloadItems(at: [indexPath])
      }
      prevIndex = indexPath
    }
    
    // 추가 버튼 변경 로직
    if checkedIndex != nil {
      addButton.setBackgroundImage(UIImage(named: "nextBtnBlack"), for: .normal)
      addButton.setupButton(title: "추가", color: .hackerWhite, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      addButton.isUserInteractionEnabled = true
    } else {
      addButton.setBackgroundImage(UIImage(named: "nextBtn"), for: .normal)
      addButton.setupButton(title: "추가", color: .hackerDarkGray, font: .btnText(ofSize: 32), backgroundColor: .clear, state: .normal, radius: 0)
      addButton.isUserInteractionEnabled = false
    }
  }
}
