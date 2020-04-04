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

    if let tableView = tableView {
      view.addSubview(tableView)
    }

    setupConstraintsForTableView()
  }

  private func setupConstraintsForTableView() {
    tableView?.translatesAutoresizingMaskIntoConstraints = false

    guard let tableViewLeftAnchor = tableView?.leftAnchor.constraint(equalTo: view.leftAnchor),
      let tableViewRightAnchor = tableView?.rightAnchor.constraint(equalTo: view.rightAnchor),
      let tableViewTopAnchor = tableView?.topAnchor.constraint(equalTo: view.topAnchor),
      let tableViewBottomAnchor = tableView?.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      else { return }

    view.addConstraints([tableViewLeftAnchor, tableViewRightAnchor, tableViewTopAnchor, tableViewBottomAnchor])
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
    return UITableViewCell()
  }
}

// MARK: - TableViewDelegate Setup
extension ViewController: UITableViewDelegate {
}
