//
//  UILabel+Factory.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 10.06.2025.
//

import UIKit

extension UILabel {
  static func make(
    font: UIFont,
    alignment: NSTextAlignment = .natural,
    numberOfLines: Int = 1,
    textColor: UIColor = .label
  ) -> UILabel {
    let label = UILabel()

    label.font = font
    label.textAlignment = alignment
    label.numberOfLines = numberOfLines
    label.textColor = textColor
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
}
