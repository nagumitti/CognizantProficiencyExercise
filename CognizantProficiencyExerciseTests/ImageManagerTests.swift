//
//  ImageManagerTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 11/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class ImageManagerTests: XCTestCase {
  var imageManager: ImageManager!
  override func setUp() {
    super.setUp()
    imageManager = ImageManager()
  }

  override func tearDown() {
    super.tearDown()
    imageManager = nil
  }

  func testImageDownloadTask() {
    let expectation = XCTestExpectation(description: "Download fact image")
    let imageUrlString = "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg/220px-American_Beaver.jpg"
    imageManager.downloadImageFromURL(IndexPath(item: 0, section: 0), imageUrlString) { (status, indexpath, image) in
      XCTAssertNotNil(image, "No image was downloaded.")
      XCTAssertTrue(status, "No image was downloaded.")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10.0)
  }

  func testIfUrlStringIsEmpty() {
    let expectation = XCTestExpectation(description: "Download fact image")
    let imageUrlString = ""
    imageManager.downloadImageFromURL(IndexPath(item: 0, section: 0), imageUrlString) { (status, indexpath, image) in
      XCTAssertNil(image, "No image was downloaded.")
      XCTAssertFalse(status, "No image was downloaded.")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10.0)
  }

  func testImageDataNil() {
    let expectation = XCTestExpectation(description: "Download fact image")
    let imageUrlString = "http://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/American_Beaver.jpg"
    imageManager.downloadImageFromURL(IndexPath(item: 0, section: 0), imageUrlString) { (status, indexpath, image) in
      XCTAssertNil(image, "No image was downloaded.")
      XCTAssertFalse(status, "No image was downloaded.")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10.0)
  }
}
