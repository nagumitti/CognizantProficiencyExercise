//
//  ErrorResult.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

enum ErrorResult: Error {
  case network(string: String)
  case parser(string: String)
  case custom(string: String)
}
