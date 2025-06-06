//
//  HomeViewController.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import UIKit

final class HomeViewController: UIViewController {

  private let viewModel: HomeViewModel

  // MARK: UI Components
  private let searchBar = UISearchBar()
  private let tableView = UITableView()
  private let loadingIndicator = UIActivityIndicatorView(style: .medium)
  private let messageLabel = UILabel()

  // MARK: View Lifecycle
  init(viewModel: HomeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindViewModel()
  }

  private func bindViewModel() {
    viewModel.onStateChange = { [weak self] state in
      guard let self = self else { return }

      switch state {
      case .idle:
        self.loadingIndicator.stopAnimating()
        self.messageLabel.isHidden = true
        self.tableView.reloadData()

      case .loading:
        self.messageLabel.isHidden = true
        self.loadingIndicator.startAnimating()

      case .success:
        self.loadingIndicator.stopAnimating()
        self.messageLabel.isHidden = true
        self.tableView.reloadData()

      case .failure(let errorMessage):
        self.loadingIndicator.stopAnimating()
        self.tableView.reloadData()
        self.messageLabel.text = errorMessage
        self.messageLabel.isHidden = false
      }
    }
  }

  // MARK: UI Setup
  private func setupUI() {
    view.backgroundColor = .systemBackground
    title = "Film Ara"

    searchBar.placeholder = "Film ismi girin"
    searchBar.delegate = self
    navigationItem.titleView = searchBar

    tableView.dataSource = self
    tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.reuseIdentifier)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(tableView)

    loadingIndicator.hidesWhenStopped = true
    loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(loadingIndicator)

    messageLabel.textAlignment = .center
    messageLabel.numberOfLines = 0
    messageLabel.textColor = .secondaryLabel
    messageLabel.isHidden = true
    messageLabel.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(messageLabel)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      messageLabel.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor, constant: 20),
      messageLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20)
    ])
  }

}

// MARK: UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {

  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    viewModel.searchMovies(query: searchBar.text ?? "")
  }

}

// MARK: UITableViewDataSource
extension HomeViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.numberOfMovies
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.reuseIdentifier, for: indexPath) as? MovieTableViewCell else {
      return UITableViewCell()
    }

    let movie = viewModel.movie(at: indexPath.row)

    cell.configure(with: movie)
    return cell
  }

}
