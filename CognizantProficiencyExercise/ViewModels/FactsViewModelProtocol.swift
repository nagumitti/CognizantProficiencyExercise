//
//  FactsViewModelProtocol.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

protocol FactsViewModelProtocol {
  var title: String { get }
  var rows: [FactDataModel] { get }

  func fetchServiceCall(_ completion: ((Result<Bool, ErrorResult>) -> Void)?)
}
