//
//  RequestFactory.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

final class RequestFactory {
  enum Method: String {
    case GET, POST, PUT, DELETE, PATCH
  }
  
  static func request(method: Method, url: URL) -> URLRequest {
    var request = URLRequest(url: url)
    request.httpMethod = method.rawValue
    return request
  }
}
