//
//  ViewController.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

// Displays the tableview with the contents recieved from the view model.
final class ViewController: UIViewController {
  private var tableView: UITableView?
  private var refreshControl: UIRefreshControl?
  private var activityIndicator: UIActivityIndicatorView?
  private let tableViewCellId = "FactTableViewCell"
  private var service: FactsServiceProtocol?
  private var viewModel: FactsViewModelProtocol?

  override func viewDidLoad() {
    super.viewDidLoad()

    initializeTableView()
    initializeRefreshControl()
    initializeActivityIndicator()
    factsServiceCall()
  }

  func configure(viewModel: FactsViewModelProtocol,
                 service: FactsServiceProtocol) {
    self.service = service
    self.viewModel = viewModel
  }

  // MARK: - Initialize TableView, RefreshControl, ActivityIndicator
  private func initializeTableView() {
    tableView = UITableView(frame: .zero, style: .plain)
    tableView?.allowsSelection = false
    tableView?.dataSource = self
    tableView?.register(FactTableViewCell.self, forCellReuseIdentifier: tableViewCellId)

    if let tableView = tableView {
      view.addSubview(tableView)
    }

    tableView?.anchor(top: view.topAnchor, left: view.leadingAnchor,
                      bottom: view.bottomAnchor, right: view.trailingAnchor,
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

  private func initializeActivityIndicator() {
    activityIndicator = UIActivityIndicatorView(style: .gray)
    activityIndicator?.hidesWhenStopped = true

    if let activityIndicator = activityIndicator {
      view.addSubview(activityIndicator)
    }

    activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
    activityIndicator?.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    activityIndicator?.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
  }

  // Get the facts json data and show activity indicator while fetching the service.
  @objc private func factsServiceCall() {
    guard let viewModel = viewModel else {
      return
    }
    UIApplication.shared.isNetworkActivityIndicatorVisible = true
    activityIndicator?.startAnimating()
    viewModel.fetchServiceCall { [weak self] result in
      self?.activityIndicator?.stopAnimating()
      switch result {
      case .success :
        self?.title = self?.viewModel?.title ?? ""
        self?.tableView?.reloadData()
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
    viewModel?.rows.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId,
                                                   for: indexPath) as? FactTableViewCell,
      let viewModel = viewModel else { return UITableViewCell() }
    let dataModel = viewModel.rows[indexPath.row]
    cell.configureCell(dataModel)
    //Download the image from the imageHref asynchronossly.
    ImageManager().downloadImageFromURL(indexPath, dataModel.imageHref ?? "") { [weak self] (success, indexPath, image) in
      let cell = self?.tableView?.cellForRow(at: indexPath!) as? FactTableViewCell
      if success {
        cell?.factImageView?.image = image
      } else {
        cell?.factImageView?.image = UIImage(named: "placeholder")
      }
    }
    return cell
  }
}
