//
//  AppDelegate.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import FirebaseCore
import FirebaseMessaging
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate {

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    AppConfigurer.configureDependencies()

    UNUserNotificationCenter.current().delegate = self

    let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]

    UNUserNotificationCenter.current().requestAuthorization(options: authOptions) { granted, error in
      print("Notification permission granted: \(granted)")
    }

    application.registerForRemoteNotifications()
    Messaging.messaging().delegate = self

    return true
  }

  // MARK: APNs & FCM Token
  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    Messaging.messaging().apnsToken = deviceToken
  }

  func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {}

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}

}

// MARK: UNUserNotificationCenterDelegate
extension AppDelegate: UNUserNotificationCenterDelegate {
  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    completionHandler([.banner, .sound])
  }

  func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    let userInfo = response.notification.request.content.userInfo

    print("User tapped notification: \(userInfo)")
    completionHandler()
  }
}
