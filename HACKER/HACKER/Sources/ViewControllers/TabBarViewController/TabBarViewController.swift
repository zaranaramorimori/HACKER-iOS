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
    self.view.backgroundColor = .hackerWhite
    setTabbarUI()
  }
}

// MARK: - Extension
extension TabBarViewController {
  func setTabbarUI() {
    /// TabBar 설정
    let tabBar: UITabBar = self.tabBar
    tabBar.backgroundColor = .hackerWhite
    tabBar.tintColor = .red
    tabBar.isHidden = false
    /// 네비게이션 뷰컨으로 푸쉬했을 때 밑에 바가 사라지지 않도록
    self.hidesBottomBarWhenPushed = false
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    let firstNavigationController = UINavigationController()
    let firstTabController = LoginViewController()
    firstNavigationController.addChild(firstTabController)
    /// 기본으로 보여질 이미지
    firstNavigationController.tabBarItem.image = UIImage(named: "fightIconInactive")?.withRenderingMode(.alwaysOriginal)
    /// 선택되었을 때 보여질 이미지
    firstNavigationController.tabBarItem.selectedImage = UIImage(named: "fightIconActive")?.withRenderingMode(.alwaysOriginal)
    
    let secondNavigationController = UINavigationController()
    let secondTabController = MainViewController()
    secondNavigationController.addChild(secondTabController)
    /// 기본으로 보여질 이미지
    secondNavigationController.tabBarItem.image = UIImage(named: "homeIconInactive")?.withRenderingMode(.alwaysOriginal)
    /// 선택되었을 때 보여질 이미지
    secondNavigationController.tabBarItem.selectedImage = UIImage(named: "homeIconActive")?.withRenderingMode(.alwaysOriginal)
    
    let thirdNavigationController = UINavigationController()
    let thirdTabController = LoginViewController()
    thirdNavigationController.addChild(thirdTabController)
    /// 기본으로 보여질 이미지
    thirdNavigationController.tabBarItem.image = UIImage(named: "myPageIconInactive")?.withRenderingMode(.alwaysOriginal)
    /// 선택되었을 때 보여질 이미지
    thirdNavigationController.tabBarItem.selectedImage = UIImage(named: "myPageIconActive")?.withRenderingMode(.alwaysOriginal)
    
    let viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
    self.setViewControllers(viewControllers, animated: true)
    /// 처음 선택된 VC 설정
    self.selectedViewController = secondNavigationController
  }
}
