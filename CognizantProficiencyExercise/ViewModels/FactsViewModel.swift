//
//  FactsViewModel.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

class FactsViewModel: FactsViewModelProtocol {
  private var service: FactsServiceProtocol?
  var title: String
  var rows: [FactDataModel]

  init(withService service: FactsServiceProtocol) {
    self.service = service
    self.title = ""
    rows = []
  }

  // We are making service call and get the parced factsmodel and save result into FactsViewModel properties
  func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)? = nil) {
    guard let service = service else {
      completion?(Result.failure(ErrorResult.custom(string: "Missing service")))
      return
    }
    service.fetchFacts { result in
      DispatchQueue.main.async {
        switch result {
        case .success(let converter) :
          if
            let rows = converter.rows,
            let title = converter.title
          {
            self.title = title
            self.rows = rows
            completion?(Result.success(true))
          } else {
            completion?(Result.failure(.custom(string: "Error while parsing json data")))
          }

          break
        case .failure(let error) :
          print("Parser error \(error)")
          completion?(Result.failure(error))
          break
        }
      }
    }
  }

}
