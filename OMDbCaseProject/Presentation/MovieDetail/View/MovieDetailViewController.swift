//
//  MovieDetailViewController.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Kingfisher
import UIKit

final class MovieDetailViewController: UIViewController {

  private let viewModel: MovieDetailViewModel

  // MARK: UI Components
  private let loadingIndicator = UIActivityIndicatorView.make()
  private let posterImageView = UIImageView.make()
  private let titleLabel = UILabel.make(font: .boldSystemFont(ofSize: 24), alignment: .center, numberOfLines: 2)
  private let yearLabel = UILabel.make(font: .systemFont(ofSize: 16), alignment: .center)
  private let plotLabel = UILabel.make(font: .systemFont(ofSize: 16), alignment: .justified, numberOfLines: 0)
  private let textStack = UIStackView.vertical()

  // MARK: Controller Lifecycle
  init(viewModel: MovieDetailViewModel) {
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

  private func updateUI(with movie: MovieDetail) {
    titleLabel.text = movie.title
    yearLabel.text = "Yıl: \(movie.year)"
    plotLabel.text = movie.plot

    if let url = movie.posterURL {
      posterImageView.kf.setImage(with: url)
    }
  }

  private func bindViewModel() {
    viewModel.onStateChange = { [weak self] state in
      DispatchQueue.main.async {
        guard let self = self else { return }

        switch state {
        case .loading:
          self.title = "Yükleniyor..."
          self.loadingIndicator.startAnimating()

        case .success(let movie):
          self.title = movie.title
          self.loadingIndicator.stopAnimating()
          self.updateUI(with: movie)

        case .failure(let error):
          self.loadingIndicator.stopAnimating()
          self.showAlert(title: "Hata", message: error, buttonTitle: "Tamam")
        }
      }
    }
  }

  // MARK: UI Setup
  private func setupUI() {
    view.backgroundColor = .systemBackground

    [titleLabel, yearLabel, plotLabel].forEach {
      textStack.addArrangedSubview($0)
    }

    view.addSubview(loadingIndicator)
    view.addSubview(posterImageView)
    view.addSubview(textStack)

    NSLayoutConstraint.activate([
      loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),

      posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      posterImageView.widthAnchor.constraint(equalToConstant: 200),
      posterImageView.heightAnchor.constraint(equalToConstant: 300),

      textStack.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 16),
      textStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      textStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
    ])
  }

}
