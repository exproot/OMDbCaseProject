//
//  UIActivityIndicatorView+Factory.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 10.06.2025.
//

import UIKit

extension UIActivityIndicatorView {
  static func make(
    style: UIActivityIndicatorView.Style = .medium,
    hidesWhenStopped: Bool = true
  ) -> UIActivityIndicatorView {
    let indicator = UIActivityIndicatorView(style: style)

    indicator.hidesWhenStopped = hidesWhenStopped
    indicator.translatesAutoresizingMaskIntoConstraints = false
    return indicator
  }
}
