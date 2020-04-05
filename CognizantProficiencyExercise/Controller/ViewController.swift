//
//  ViewController.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

final class ViewController: UIViewController {
  private var tableView: UITableView?
  private var refreshControl: UIRefreshControl?
  private let tableViewCellId = "FactTableViewCell"
  private var service: FactsService! = FactsService()
  lazy var viewModel: FactsViewModelProtocol = {
    let viewModel = FactsViewModel(withService: service)
    return viewModel
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    initializeTableView()
    initializeRefreshControl()
    factsServiceCall()
  }

  // MARK: - Initialize TableView, RefreshControl
  private func initializeTableView() {
    tableView = UITableView(frame: .zero, style: .plain)
    tableView?.dataSource = self
    tableView?.delegate = self
    tableView?.rowHeight = UITableView.automaticDimension
    tableView?.register(FactTableViewCell.self, forCellReuseIdentifier: tableViewCellId)

    if let tableView = tableView {
      view.addSubview(tableView)
    }

    tableView?.anchor(top: view.topAnchor, left: view.leftAnchor,
                      bottom: view.bottomAnchor, right: view.rightAnchor,
                      paddingTop: 0, paddingLeft: 0,
                      paddingBottom: 0, paddingRight: 0,
                      width: 0, height: 0)
  }

  private func initializeRefreshControl() {
    refreshControl = UIRefreshControl(frame: .zero)
    let selector = #selector(factsServiceCall)
    refreshControl?.addTarget(self, action: selector, for: UIControl.Event.valueChanged)
    if let refreshControl = refreshControl {
      tableView?.addSubview(refreshControl)
    }
  }

  @objc func factsServiceCall() {
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    self.viewModel.fetchServiceCall { result in
      switch result {
      case .success :
        self.title = self.viewModel.title
        self.tableView?.reloadData()
        break
      case .failure :
        break
      }
      UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    refreshControl?.endRefreshing()
  }
}

// MARK: - TableViewDataSource Setup
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.rows.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId,
                                                   for: indexPath) as? FactTableViewCell else { return UITableViewCell() }
    cell.configureCell(viewModel.rows[indexPath.row])
    return cell
  }
}

// MARK: - TableViewDelegate Setup
extension ViewController: UITableViewDelegate {
}
