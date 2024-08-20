//
//  AppDelegate.swift
//  Speedo Transfer


import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().delegate = self
        IQKeyboardManager.shared.enable = true
        //setRootView()
        return true
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        print("notification clicked")
        if let dic = response.notification.request.content.userInfo as? [String: Any] {
            print("dictionary: \(dic)")
            print("name: \(dic["name"] ?? "khalid")")
        }
    }
    
//    func setRootView() {
//        if let isLoggedIn = UserDefaultsManager.shared().isLoggedIn {
//            if isLoggedIn {
//                switchToHomeState()
//            } else {
//                switchToAuthState()
//            }
//        }
//    }
//
//    func switchToAuthState() {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let logVC = sb.instantiateViewController(withIdentifier: "SignInVC") as! signInVC
//        UserDefaultsManager.shared().isLoggedIn = false
//        window?.rootViewController = logVC
//    }
//
//    func switchToHomeState() {
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let homeVC = sb.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
//        window?.rootViewController = homeVC
//    }
    
}

