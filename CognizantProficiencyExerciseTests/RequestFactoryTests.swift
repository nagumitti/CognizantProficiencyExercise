//
//  RequestFactoryTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 11/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class RequestFactoryTests: XCTestCase {
  func testRequestIsGETMethod() {
    let requestFactory = RequestFactory.request(method: .GET, url: URL(string: "https://www.google.com")!)

    XCTAssertNotNil(requestFactory)
    XCTAssertEqual(requestFactory.httpMethod, RequestFactory.Method.GET.rawValue)
  }

  func testRequestIsPOSTMethod() {
    let requestFactory = RequestFactory.request(method: .POST, url: URL(string: "https://www.google.com")!)

    XCTAssertNotNil(requestFactory)
    XCTAssertEqual(requestFactory.httpMethod, RequestFactory.Method.POST.rawValue)
  }

  func testRequestIsPUTMethod() {
    let requestFactory = RequestFactory.request(method: .PUT, url: URL(string: "https://www.google.com")!)

    XCTAssertNotNil(requestFactory)
    XCTAssertEqual(requestFactory.httpMethod, RequestFactory.Method.PUT.rawValue)
  }
  func testRequestIsDELETEMethod() {
    let requestFactory = RequestFactory.request(method: .DELETE, url: URL(string: "https://www.google.com")!)

    XCTAssertNotNil(requestFactory)
    XCTAssertEqual(requestFactory.httpMethod, RequestFactory.Method.DELETE.rawValue)
  }
  func testRequestIsPATCHMethod() {
    let requestFactory = RequestFactory.request(method: .PATCH, url: URL(string: "https://www.google.com")!)

    XCTAssertNotNil(requestFactory)
    XCTAssertEqual(requestFactory.httpMethod, RequestFactory.Method.PATCH.rawValue)
  }
}
