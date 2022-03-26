//
//  ShoppingCollectionViewCell.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/26.
//

import UIKit

import SnapKit
import Then

// MARK: - ShoppingCollectionViewCell
class ShoppingCollectionViewCell: UICollectionViewCell {
  
  // MARK: - Components
  let myFriendsCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    return collectionView
  }()
  var closure: (() -> Void)?
  
  // MARK: - LifeCycle
  override func awakeFromNib() {
    super.awakeFromNib()
    register()
    attribute()
    layout()
  }
}
// MARK: - Extensions
extension ShoppingCollectionViewCell {
  func register() {
    self.myFriendsCollectionView.register(AddFriendCollectionViewCell.self, forCellWithReuseIdentifier: AddFriendCollectionViewCell.identifier)
    self.myFriendsCollectionView.register(MyFriendsCollectionViewCell.self, forCellWithReuseIdentifier: MyFriendsCollectionViewCell.identifier)
  }
  func attribute() {
    self.myFriendsCollectionView.delegate = self
    self.myFriendsCollectionView.dataSource = self
  }
  func layout() {
    layoutMyFriendsCollectionView()
  }
  func layoutMyFriendsCollectionView() {
    self.contentView.add(myFriendsCollectionView) {
      $0.backgroundColor = .hackerWhite
      $0.isUserInteractionEnabled = true
      $0.showsVerticalScrollIndicator = false
      $0.snp.makeConstraints { make in
        make.top.equalToSuperview().offset(10)
        make.leading.equalToSuperview().offset(24)
        make.trailing.equalToSuperview().offset(-24)
        make.bottom.equalToSuperview()
      }
    }
  }
  func setupNewFriend() {
    let addFriendVC = AddFriendViewController()
    self.parentViewController?.navigationController?.pushViewController(addFriendVC, animated: false)
  }
}
// MARK: - UICollectionViewDataSource
extension ShoppingCollectionViewCell: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 30
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let addCell = collectionView.dequeueReusableCell(withReuseIdentifier: AddFriendCollectionViewCell.identifier, for: indexPath) as? AddFriendCollectionViewCell else { return UICollectionViewCell() }
    guard let friendCell = collectionView.dequeueReusableCell(withReuseIdentifier: MyFriendsCollectionViewCell.identifier, for: indexPath) as? MyFriendsCollectionViewCell else { return UICollectionViewCell() }
    
    if indexPath.item == 0 {
      addCell.awakeFromNib()
      return addCell
    } else {
      friendCell.awakeFromNib()
      return friendCell
    }
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if indexPath.item == 0 {
      print("얍")
      self.setupNewFriend()
    }
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ShoppingCollectionViewCell: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let cellWidth = (collectionView.frame.width-24)/3
    let cellHeight = (cellWidth)*1.38
    return CGSize(width: cellWidth, height: cellHeight)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 12
  }
}
