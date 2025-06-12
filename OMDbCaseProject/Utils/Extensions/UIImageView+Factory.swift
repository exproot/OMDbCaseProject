//
//  UIImageView+Factory.swift
//  OMDbCaseProject
//
//  Created by Ertan Yağmur on 10.06.2025.
//

import UIKit

extension UIImageView {
  static func make(
    contentMode: UIView.ContentMode = .scaleAspectFill,
    clipsToBounds: Bool = true,
    cornerRadius: CGFloat = 0.0
  ) -> UIImageView {
    let imageView = UIImageView()

    imageView.contentMode = contentMode
    imageView.clipsToBounds = clipsToBounds
    imageView.layer.cornerRadius = cornerRadius
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }
}
