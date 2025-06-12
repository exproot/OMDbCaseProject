//
//  SplashViewController.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 5.06.2025.
//

import UIKit

final class SplashViewController: UIViewController {

  private let viewModel: SplashViewModel

  // MARK: Controller Lifecycle
  private let titleLabel = UILabel.make(font: .boldSystemFont(ofSize: 24), alignment: .center)

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
        self?.showAlert(title: "Bağlantı Hatası", message: "Internet bağlantısı yok.", buttonTitle: "Tamam")
      }
    }
  }

  // MARK: UI Setup
  private func setupUI() {
    view.backgroundColor = .systemBackground
    view.addSubview(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

}
