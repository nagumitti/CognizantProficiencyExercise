//
//  FactsViewModelTests.swift
//  CognizantProficiencyExerciseTests
//
//  Created by Nagaraj on 10/04/20.
//

import XCTest
@testable import CognizantProficiencyExercise

class FactsViewModelTests: XCTestCase {
  var viewModel: FactsViewModel!
  private var mockService: MockFactsService!

  override func setUp() {
    super.setUp()
    self.mockService = MockFactsService()
    self.viewModel = FactsViewModel(withService: mockService)
  }

  override func tearDown() {
    self.viewModel = nil
    self.mockService = nil
    super.tearDown()
  }

  func testFetchFacts() {
    mockService.factsData = FactsModel(title: "Canada", rows: [])
    viewModel.fetchServiceCall { result in
      switch result {
      case .failure :
        XCTAssert(false, "ViewModel should not be able to fetch without service")
      default: break
      }
    }
  }

  func testFetchNoFacts() {
    mockService.factsData = nil
    viewModel.fetchServiceCall { result in
      switch result {
      case .success :
        XCTAssert(false, "ViewModel should not be able to fetch ")
      default: break
      }
    }
  }
}
