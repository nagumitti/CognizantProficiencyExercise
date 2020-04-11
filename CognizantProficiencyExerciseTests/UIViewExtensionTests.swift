//
//  UIViewExtensionTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 11/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class UIViewExtensionTests: XCTestCase {
  func testAnchors() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    view.addSubview(subview)

    subview.anchor(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 50, height: 50)

    XCTAssertNotNil(view.constraints)
    XCTAssertEqual(view.constraints.count, 4)
    XCTAssertEqual(subview.constraints.count, 2)
    XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
    XCTAssertFalse(subview.translatesAutoresizingMaskIntoConstraints)
  }

  func testBottomAnchorGreaterThanOrEqual() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    view.addSubview(subview)

    subview.bottomAnchorGreaterThanOrEqualTo(top: view.topAnchor, left: view.leadingAnchor, bottom: view.bottomAnchor, right: view.trailingAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 50, height: 50)

    XCTAssertNotNil(view.constraints)
    XCTAssertEqual(view.constraints.count, 4)
    XCTAssertEqual(subview.constraints.count, 2)
    XCTAssertTrue(view.translatesAutoresizingMaskIntoConstraints)
    XCTAssertFalse(subview.translatesAutoresizingMaskIntoConstraints)
  }

  func testConstraintsIsEmpty() {
    let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    let subview = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))

    view.addSubview(subview)

    subview.anchor(top: nil, left: nil, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10, width: 0, height: 0)

    XCTAssertTrue(view.constraints.isEmpty)
    XCTAssertTrue(subview.constraints.isEmpty)
  }
}
