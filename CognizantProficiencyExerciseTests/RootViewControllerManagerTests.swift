//
//  RootViewControllerManagerTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 11/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class RootViewControllerManagerTests: XCTestCase {
  var rootViewControllerManager: RootViewControllerManager!

  override func setUp() {
    super.setUp()
    rootViewControllerManager = RootViewControllerManager()
  }

  override func tearDown() {
    super.tearDown()
    rootViewControllerManager = nil
  }

  func testRootViewController() {
    let rootViewController = rootViewControllerManager.rootViewController() as? UINavigationController

    XCTAssertNotNil(rootViewController)
    XCTAssertNotNil(rootViewController?.viewControllers.first)
    XCTAssertTrue(rootViewController?.viewControllers.first is ViewController)
  }
}
