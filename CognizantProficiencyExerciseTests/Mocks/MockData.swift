//
//  MockData.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 10/04/20.

import XCTest
@testable import CognizantProficiencyExercise

class MockData {
  func getFactsData() -> Data {
    guard let data = self.readJson(forResource: "facts") else {
      XCTAssert(false, "Can't get data from facts.json")
      return Data()
    }
    return data
  }

  func getFacts() -> FactsModel {
    var responseResults: FactsModel!
    guard let data = self.readJson(forResource: "facts") else {
      XCTAssert(false, "Can't get data from facts.json")
      return FactsModel(title: "test Title", rows: nil)
    }
    let completion: ((Result<FactsModel, ErrorResult>) -> Void) = { result in
      switch result {
      case .failure:
        XCTAssert(false, "Expected valid converter")
      case .success(let result):
        responseResults = result
        break
      }
    }
    ParserHelper.parse(data: data, completion: completion)
    return responseResults
  }

  func getFactslist() -> [FactDataModel] {
    guard let list = getFacts().rows else {
      return [FactDataModel(title: "title", description: "description", imageHref: "imageHref")]
    }
    return list
  }
}

extension MockData {
  func readJson(forResource fileName: String ) -> Data? {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: fileName, withExtension: "json") else {
      XCTFail("Missing file: \(fileName).json")
      return nil
    }

    do {
      let data = try Data(contentsOf: url)
      return data
    } catch (_) {
      XCTFail("unable to read json")
      return nil
    }
  }
}
