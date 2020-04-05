//
//  FactsServiceProtocol.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

protocol FactsServiceProtocol {
    func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void))
}
