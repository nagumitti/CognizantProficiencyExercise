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
  private var rootViewControllerManager: RootViewControllerManager?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    // Get the root view controller from the RootViewControllerManager
    rootViewControllerManager = RootViewControllerManager()
    window?.backgroundColor = .white
    window?.rootViewController = rootViewControllerManager?.rootViewController()
    window?.makeKeyAndVisible()

    return true
  }

}
