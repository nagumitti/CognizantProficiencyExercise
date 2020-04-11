//
//  ParserHelper.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

protocol Parceable {
  static func parseObject(data: Data) -> Result<Self, ErrorResult>
}

final class ParserHelper {
  // Parsing the response recieved from the service call.
  static func parse<T: Parceable>(data: Data, completion: (Result<T, ErrorResult>) -> Void) {
    if let response = String(data: data, encoding: String.Encoding.ascii),
      let data = response.data(using: String.Encoding.utf8) {
      switch T.parseObject(data: data) {
      case .failure(let error):
        completion(.failure(error))
        break
      case .success(let newModel):
        completion(.success(newModel))
        break
      }
    } else {
      completion(.failure(.parser(string: "Error while parsing json data")))
    }
  }
}
