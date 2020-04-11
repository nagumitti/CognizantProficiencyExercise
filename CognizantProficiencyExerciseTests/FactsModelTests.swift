//
//  FactsModelTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 10/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class FactsModelTests: XCTestCase {
  func testEmptyFactsResult() {
    let data = Data()
    let completion: ((Result<FactsModel, ErrorResult>) -> Void) = { result in
      switch result {
      case .success:
        XCTAssert(false, "Expected failure when no data")
      default:
        break
      }
    }
    ParserHelper.parse(data: data, completion: completion)
  }

  func testParseFactsResult() {
    let data = MockData().getFactsData()
    let completion: ((Result<FactsModel, ErrorResult>) -> Void) = { result in
      switch result {
      case .failure:
        XCTAssert(false, "Expected valid FactsModel")
      case .success(let response):
        XCTAssertEqual(response.title, "About Canada", "Expected About Canada base")
        if let list = response.rows {
          XCTAssertEqual(list.count, 14, "Expected 14 rates")

        } else {
          XCTAssert(false, "Expected valid ListModel")
        }
      }
    }
    ParserHelper.parse(data: data, completion: completion)
  }

  func testWrongKeyFactsResult() {
    let data = Data()
    let result = FactsModel.parseObject(data: data)
    switch result {
    case .success:
      XCTAssert(false, "Expected failure when wrong data")
    default:
      return
    }
  }
}
