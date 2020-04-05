//
//  RequestHandler.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

class RequestHandler {
  func networkResult<T: Parceable>(completion: @escaping ((Result<T, ErrorResult>) -> Void)) ->
    ((Result<Data, ErrorResult>) -> Void) {
      return { dataResult in
        print(dataResult)
        DispatchQueue.global(qos: .userInteractive).async(execute: {
          switch dataResult {
          case .success(let data) :
            ParserHelper.parse(data: data, completion: completion)
            break
          case .failure(let error) :
            print("Network error \(error)")
            completion(.failure(.network(string: "Network error " + error.localizedDescription)))
            break
          }
        })
      }
  }
}
