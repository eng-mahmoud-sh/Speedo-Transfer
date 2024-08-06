//
//  AppDelegate.swift
//  Speedo Transfer


import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
        //setRootView()
        return true
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

