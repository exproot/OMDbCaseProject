//
//  MovieTableViewCell.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 6.06.2025.
//

import Kingfisher
import UIKit

final class MovieTableViewCell: UITableViewCell {

  static let reuseIdentifier = String(describing: MovieTableViewCell.self)

  // MARK: UI Components
  private let posterImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.layer.cornerRadius = 8
    return imageView
  }()

  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .boldSystemFont(ofSize: 16)
    label.numberOfLines = 0
    return label
  }()

  private let yearLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .secondaryLabel
    return label
  }()

  private let textStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 4
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()

  private let containerStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .horizontal
    stack.spacing = 16
    stack.alignment = .top
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()

  // MARK: Cell Lifecycle
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with movie: Movie) {
    titleLabel.text = movie.title
    yearLabel.text = movie.year

    if let url = movie.posterURL {
      posterImageView.kf.setImage(with: url, placeholder: UIImage(systemName: "questionmark"))
    } else {
      posterImageView.image = UIImage(systemName: "questionmark")
    }
  }

  // MARK: UI Setup
  private func setupUI() {
    textStack.addArrangedSubview(titleLabel)
    textStack.addArrangedSubview(yearLabel)

    containerStack.addArrangedSubview(posterImageView)
    containerStack.addArrangedSubview(textStack)

    contentView.addSubview(containerStack)

    NSLayoutConstraint.activate([
      posterImageView.widthAnchor.constraint(equalToConstant: 80),
      posterImageView.heightAnchor.constraint(equalTo: posterImageView.widthAnchor, multiplier: 1.5),

      containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
      containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
    ])
  }
}
