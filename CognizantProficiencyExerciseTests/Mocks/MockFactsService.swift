//
//  MockFactsService.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 10/04/20.

import Foundation
@testable import CognizantProficiencyExercise

class MockFactsService: FactsServiceProtocol {
  var factsData: FactsModel?
  func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void)) {
    if let data = factsData {
      completion(Result.success(data))
    } else {
      completion(Result.failure(ErrorResult.custom(string: "No converter")))
    }
  }
}
