//
//  ImageManager.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 05/04/20.
//

import UIKit

protocol ImageManaging: class {
  func downloadImageFromURL(_ indexPath: IndexPath?,
                            _ urlString: String,
                            completion: ((_ success: Bool, _ indexPath: IndexPath?, _ image: UIImage?) -> Void)?)
}

final class ImageManager: NSObject {
  private var indexPath: IndexPath?

  func downloadImageFromURL(_ indexPath: IndexPath?,
                            _ urlString: String,
                            completion: ((_ success: Bool, _ indexPath: IndexPath?, _ image: UIImage?) -> Void)?) {
    self.indexPath = indexPath
    if let url = URL(string: urlString) { // download from URL asynchronously
      let session = URLSession.shared
      let downloadTask = session.downloadTask(with: url, completionHandler: { (retrievedURL, _, error) -> Void in
        var found = false
        if error != nil { print("Error downloading image \(url.absoluteString): \(error!.localizedDescription)") } else if retrievedURL != nil {
          if let data = try? Data(contentsOf: retrievedURL!) {
            if let image = UIImage(data: data) {
              found = true
              DispatchQueue.main.async(execute: { completion?(true, indexPath, image) })
            }
          }
        }
        if !found { DispatchQueue.main.async(execute: { completion?(false, indexPath, nil) }); }
      })
      downloadTask.resume()
    } else { completion?(false, indexPath, nil) }
  }
}
