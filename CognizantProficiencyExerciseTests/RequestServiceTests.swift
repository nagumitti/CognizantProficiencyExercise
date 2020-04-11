//
//  RequestServiceTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 11/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class RequestServiceTests: XCTestCase {
  var requestService: RequestService!

  override func setUp() {
    super.setUp()
    requestService = RequestService()
  }

  override func tearDown() {
    super.tearDown()
    requestService = nil
  }

  func testToGetFactJson() {
    let expectation = XCTestExpectation(description: "Download fact json")
    let urlString = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    let _ = requestService.loadData(urlString: urlString) { result in
      XCTAssertNotNil(try? result.get(), "No image was downloaded.")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10.0)
  }

  func testIfUrlStringIsEmpty() {
    let expectation = XCTestExpectation(description: "Download fact json")
    let urlString = ""
    let _ = requestService.loadData(urlString: urlString) { result in
      XCTAssertNil(try? result.get(), "No image was downloaded.")
      expectation.fulfill()
    }
    wait(for: [expectation], timeout: 10.0)
  }

}
