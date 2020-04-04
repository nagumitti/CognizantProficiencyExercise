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

  override func viewDidLoad() {
    super.viewDidLoad()

    initializeTableView()
    initializeRefreshControl()
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
    let selector = #selector(handleRefresh)
    refreshControl?.addTarget(self, action: selector, for: UIControl.Event.valueChanged)
    if let refreshControl = refreshControl {
      tableView?.addSubview(refreshControl)
    }
  }

  @objc private func handleRefresh() {
    //Handle refresh of requests
  }
}

// MARK: - TableViewDataSource Setup
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellId,
                                                   for: indexPath) as? FactTableViewCell else { return UITableViewCell() }
    return cell
  }
}

// MARK: - TableViewDelegate Setup
extension ViewController: UITableViewDelegate {
}
