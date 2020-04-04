//
//  FactsModel.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

struct FactsModel: Decodable {
    let title: String?
    let rows: [FactDataModel]?
}
