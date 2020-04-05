//
//  FactsService.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import Foundation

class FactsService: RequestHandler, FactsServiceProtocol {
    private let endpoint = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
    var task: URLSessionTask?

    func fetchFacts(_ completion: @escaping ((Result<FactsModel, ErrorResult>) -> Void)) {
        self.cancelFetchFeeds()
        task = RequestService().loadData(urlString: endpoint, completion: self.networkResult(completion: completion))
    }

    func cancelFetchFeeds() {
        if let task = task {
            task.cancel()
        }
        task = nil
    }
}
