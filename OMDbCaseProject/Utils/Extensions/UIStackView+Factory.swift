//
//  UIStackView+Factory.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 10.06.2025.
//

import UIKit

extension UIStackView {
  static func vertical(
    spacing: CGFloat = 8,
    alignment: UIStackView.Alignment = .fill
  ) -> UIStackView {
    let stack = UIStackView()

    stack.axis = .vertical
    stack.spacing = spacing
    stack.alignment = alignment
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }

  static func horizontal(
    spacing: CGFloat = 8,
    alignment: UIStackView.Alignment = .fill
  ) -> UIStackView {
    let stack = UIStackView()

    stack.axis = .horizontal
    stack.spacing = spacing
    stack.alignment = alignment
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }
}
