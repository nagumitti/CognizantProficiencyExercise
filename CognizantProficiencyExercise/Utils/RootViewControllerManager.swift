//
//  RootViewControllerManager.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

protocol ViewControllerManagers {
  func rootViewController() -> UIViewController
}

final class RootViewControllerManager { }

// MARK: - ViewControllerManagers
extension RootViewControllerManager: ViewControllerManagers {
  func rootViewController() -> UIViewController {
    let viewController = ViewController()
    let service = FactsService()
    let viewModel = FactsViewModel(withService: service)
    viewController.configure(viewModel: viewModel, service: service)
    let navigationController = UINavigationController(rootViewController: viewController)

    return navigationController
  }
}
