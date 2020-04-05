//
//  FactsModel.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import Foundation

struct FactsModel: Decodable {
    let title: String?
    let rows: [FactDataModel]?
}

extension FactsModel: Parceable {
  static func parseObject(data: Data) -> Result<FactsModel, ErrorResult> {
    let decoder = JSONDecoder()
    if let result = try? decoder.decode(FactsModel.self, from: data) {
        return Result.success(result)
    } else {
        return Result.failure(ErrorResult.parser(string: "Unable to parse FactsModel results"))
    }
  }
}
