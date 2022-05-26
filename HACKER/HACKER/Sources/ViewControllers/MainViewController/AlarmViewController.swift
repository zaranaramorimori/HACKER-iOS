//
//  AlarmViewController.swift
//  HACKER
//
//  Created by Danna Lee on 2022/05/26.
//

import UIKit

class AlarmViewController: UIViewController {
  
  // MARK: - Components
  private let navigationBar = HackerNavigationBar()
  private lazy var alarmCollectionView: UICollectionView = { createAlarmCollectionView() }()
  private let emptyView = UIStackView()
  private let emptyImage = UIImageView()
  private let emptyTitle = UILabel()
  private let emptyDescription = UILabel()
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setStyle()
    layout()
    attribute()
    getAlarmList()
  }
}

// MARK: - UI
extension AlarmViewController {
  private func createAlarmCollectionView() -> UICollectionView {
    let layout = DynamicHeightFlowLayout()
    layout.scrollDirection = .vertical
    layout.minimumInteritemSpacing = 8
    layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    
    let collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
    collectionView.isScrollEnabled = true
    collectionView.showsHorizontalScrollIndicator = false
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.backgroundColor = .hackerWhite
    collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    collectionView.contentInsetAdjustmentBehavior = .always
    
    return collectionView
  }
  
  private func setStyle() {
    view.backgroundColor = .hackerWhite
  }
  
  private func layout() {
    layoutNavigationBar()
  }
  
  private func attribute() {
    alarmCollectionView.delegate = self
    alarmCollectionView.dataSource = self
    alarmCollectionView.register(AlarmCollectionViewCell.self, forCellWithReuseIdentifier: AlarmCollectionViewCell.identifier)
  }
  
  private func layoutNavigationBar() {
    view.addSubview(navigationBar)
    navigationBar.iconLayout(isBack: true, logoImage: UIImage(named: "alarmIcon"), rightImage: nil)
    navigationBar.popViewController = {
      self.navigationController?.popViewController(animated: true)
    }
    navigationBar.snp.makeConstraints { make in
      make.top.leading.trailing.equalTo(self.view.safeAreaLayoutGuide)
      make.height.equalTo(72)
    }
  }
  
  private func layoutAlarmCollectionView() {
    self.view.add(alarmCollectionView) {
      $0.snp.makeConstraints { make in
        make.top.equalTo(self.navigationBar.snp.bottom).offset(10)
        make.leading.trailing.equalToSuperview().inset(24)
        make.bottom.equalToSuperview()
      }
    }
  }
  
  private func layoutEmptyView() {
    
  }
}

// MARK: - Custom Methods
extension AlarmViewController {
  private func getAlarmList() {
    layoutAlarmCollectionView()
  }
}

// MARK: - UICollectionViewDataSource
extension AlarmViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlarmCollectionViewCell.identifier, for: indexPath) as? AlarmCollectionViewCell else { return UICollectionViewCell() }
    
    cell.contentLabel.text = "대머리가 머리카락을 뽑아갔어요! 대머리가 머리카락을 뽑아갔어요!"
    
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension AlarmViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets.zero
  }
}
