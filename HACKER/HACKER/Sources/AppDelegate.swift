//
//  AppDelegate.swift
//  HACKER
//
//  Created by 김지수 on 2022/01/25.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications
import AuthenticationServices

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var isLogin = false
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let acToken = UserDefaults.standard.string(forKey: Const.UserDefaultsKey.accessToken)
    
    if acToken != nil {
      if UserDefaults.standard.bool(forKey: Const.UserDefaultsKey.isAppleLogin) {
        // 애플 로그인으로 연동되어 있을 때, -> 애플 ID와의 연동상태 확인 로직
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        appleIDProvider.getCredentialState(forUserID: UserDefaults.standard.string(forKey: Const.UserDefaultsKey.appleUserCredentialId) ?? "") { (credentialState, error) in
          switch credentialState {
          case .authorized:
            print("해당 ID는 연동되어있습니다.")
            self.isLogin = true
          case .revoked:
            print("해당 ID는 연동되어있지않습니다.")
            self.isLogin = false
          case .notFound:
            print("해당 ID를 찾을 수 없습니다.")
            self.isLogin = false
          default:
            break
          }
        }
      }
    }
    // 앱 실행 중 애플 ID 강제로 연결 취소 시
    NotificationCenter.default.addObserver(forName: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil, queue: nil) { (Notification) in
      print("Revoked Notification")
      self.isLogin = false
    }
    
    FirebaseApp.configure()
    Messaging.messaging().delegate = self
    
    UNUserNotificationCenter.current().delegate = self
    
    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
    UNUserNotificationCenter.current().requestAuthorization(options: authOptions,completionHandler: {_, _ in })
    application.registerForRemoteNotifications()
    return true
  }
  
  func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
    // 세로방향 고정
    return UIInterfaceOrientationMask.portrait
  }
  
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }
  
  // MARK: UISceneSession Lifecycle
  
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }
  
  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
}

extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    print("\(#function)")
  }
}

extension AppDelegate: MessagingDelegate {
  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
    print("Firebase registration token: \(fcmToken ?? "nil")")
    let dataDict:[String: String] = ["token": fcmToken ?? ""]
    NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
  }
}
