//
//  TabBarViewController.swift
//  HACKER
//
//  Created by 김지수 on 2022/03/18.
//

import UIKit

// MARK: - TabBarViewController
class TabBarViewController: UITabBarController {
  
  // MARK: - LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setBackground()
    setTabbarUI()
    setTabbarProperty()
  }
}
// MARK: - Extension
extension TabBarViewController {
  func setBackground() {
    self.view.backgroundColor = .hackerWhite
  }
  private func setTabbarUI() {
    // TabBar 설정
    let tabBar: UITabBar = self.tabBar
    tabBar.backgroundColor = .hackerWhite
    tabBar.isHidden = false
    
    // 네비게이션 뷰컨으로 푸쉬했을 때 밑에 바가 사라지지 않도록
    self.hidesBottomBarWhenPushed = false
    
//    // iOS 15 디폴트 탭바 효과 (translucent) 없애기
//    if #available(iOS 15.0, *) {
//      let appearance = UITabBarAppearance()
//      appearance.configureWithOpaqueBackground()
//      appearance.backgroundColor = .hackerWhite
//
//      tabBar.standardAppearance = appearance
//      tabBar.scrollEdgeAppearance = appearance
//    }
  }
  
  private func setTabbarProperty() {
    viewControllers = [createFirstTab(), createSecondTab(), createThirdTab()]
    // 처음 선택된 VC 설정
    selectedIndex = 1
    
    // 탭바 아이템 가운데 정렬
    if let items = self.tabBar.items {
      for item in items {
        item.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
      }
    }
  }
  
  private func createFirstTab() -> UINavigationController {
    let firstNavigationController = UINavigationController()
    let firstTabController = FightViewController()
    firstNavigationController.addChild(firstTabController)
    // 기본으로 보여질 이미지
    firstNavigationController.tabBarItem.image = UIImage(named: "fightIconInactive")?.withRenderingMode(.alwaysOriginal)
    // 선택되었을 때 보여질 이미지
    firstNavigationController.tabBarItem.selectedImage = UIImage(named: "fightIconActive")?.withRenderingMode(.alwaysOriginal)
    
    return firstNavigationController
  }
  
  private func createSecondTab() -> UINavigationController {
    let secondNavigationController = UINavigationController()
    let secondTabController = MainViewController()
    secondNavigationController.addChild(secondTabController)
    // 기본으로 보여질 이미지
    secondNavigationController.tabBarItem.image = UIImage(named: "homeIconInactive")?.withRenderingMode(.alwaysOriginal)
    // 선택되었을 때 보여질 이미지
    secondNavigationController.tabBarItem.selectedImage = UIImage(named: "homeIconActive")?.withRenderingMode(.alwaysOriginal)
    
    return secondNavigationController
  }
  
  private func createThirdTab() -> UINavigationController {
    let thirdNavigationController = UINavigationController()
    let thirdTabController = ShoppingRankingViewController()
    thirdNavigationController.addChild(thirdTabController)
    // 기본으로 보여질 이미지
    thirdNavigationController.tabBarItem.image = UIImage(named: "myPageIconInactive")?.withRenderingMode(.alwaysOriginal)
    // 선택되었을 때 보여질 이미지
    thirdNavigationController.tabBarItem.selectedImage = UIImage(named: "myPageIconActive")?.withRenderingMode(.alwaysOriginal)
    
    return thirdNavigationController
  }
}
