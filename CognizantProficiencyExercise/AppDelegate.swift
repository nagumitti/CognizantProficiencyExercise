//
//  AppDelegate.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    let viewController = ViewController()
    let navigationController = UINavigationController(rootViewController: viewController)

    window?.backgroundColor = .white
    window?.rootViewController = navigationController
    window?.makeKeyAndVisible()

    return true
  }

}
