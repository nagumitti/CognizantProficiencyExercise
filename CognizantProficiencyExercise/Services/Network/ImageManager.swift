//
//  ImageManager.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import UIKit

protocol ImageManaging: class {
  typealias downloadCompletionHandler = ((_ success: Bool, _ indexPath: IndexPath?, _ image: UIImage?) -> Void)?
  func downloadImageFromURL(_ indexPath: IndexPath?,
                            _ urlString: String,
                            completion: downloadCompletionHandler)
}

final class ImageManager: ImageManaging {
  private var indexPath: IndexPath?
  private let session: URLSession

  init(session: URLSession = URLSession.shared) {
    self.session = session
  }

  func downloadImageFromURL(_ indexPath: IndexPath?,
                            _ urlString: String,
                            completion: downloadCompletionHandler) {
    self.indexPath = indexPath
    if let url = URL(string: urlString) {
      // download from URL asynchronously
      let downloadTask = session.downloadTask(with: url, completionHandler:
      { (retrievedURL, _, error) -> Void in
        var found = false
        if error != nil {
          print("Error downloading image \(url.absoluteString): \(error!.localizedDescription)")
        } else if retrievedURL != nil {
          if let data = try? Data(contentsOf: retrievedURL!) {
            if let image = UIImage(data: data) {
              found = true
              DispatchQueue.main.async {
                completion?(true, indexPath, image)
              }
            }
          }
        }
        if !found {
          DispatchQueue.main.async {
            completion?(false, indexPath, nil)
          }
        }
      })
      downloadTask.resume()
    } else {
      completion?(false, indexPath, nil)
    }
  }
}
