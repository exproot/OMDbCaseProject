//
//  SplashViewController.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import UIKit

final class SplashViewController: UIViewController {

  private let viewModel: SplashViewModel
  private let titleLabel = UILabel()

  init(viewModel: SplashViewModel) {
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
    viewModel.load()
  }

  private func bindViewModel() {
    viewModel.onTitleReady = { [weak self] title in
      DispatchQueue.main.async {
        self?.titleLabel.text = title
      }
    }

    viewModel.onNetworkError = { [weak self] in
      DispatchQueue.main.async {
        self?.showNetworkError()
      }
    }
  }

  private func showNetworkError() {
    let alert = UIAlertController(title: "Bağlantı Hatası", message: "Internet bağlantısı yok.", preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "Tamam", style: .default))
    present(alert, animated: true)
  }

  private func setupUI() {
    view.backgroundColor = .systemBackground

    titleLabel.textAlignment = .center
    titleLabel.font = .boldSystemFont(ofSize: 24)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(titleLabel)
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

}
