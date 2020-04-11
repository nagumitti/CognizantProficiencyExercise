//
//  UIViewExtension.swift
//  CognizantProficiencyExercise
//
//  Created by Nagaraj on 04/04/20.
//

import UIKit

extension UIView {
  func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
              bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
              paddingTop: CGFloat, paddingLeft: CGFloat,
              paddingBottom: CGFloat, paddingRight: CGFloat,
              width: CGFloat, height: CGFloat) {
    translatesAutoresizingMaskIntoConstraints = false

    if let top = top {
      topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
    }
    if let left = left {
      leadingAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
    }
    if let right = right {
      right.constraint(equalTo: trailingAnchor, constant: paddingRight).isActive = true
    }
    if let bottom = bottom {
      bottom.constraint(equalTo: bottomAnchor, constant: paddingBottom).isActive = true
    }
    if height != 0 {
      heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    if width != 0 {
      widthAnchor.constraint(equalToConstant: width).isActive = true
    }
  }

  func bottomAnchorGreaterThanOrEqualTo(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?,
                                        bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?,
                                        paddingTop: CGFloat, paddingLeft: CGFloat,
                                        paddingBottom: CGFloat, paddingRight: CGFloat,
                                        width: CGFloat, height: CGFloat) {
    anchor(top: top, left: left,
           bottom: nil, right: right,
           paddingTop: paddingTop, paddingLeft: paddingLeft,
           paddingBottom: 0, paddingRight: paddingRight,
           width: width, height: height)

    if let bottom = bottom {
      bottom.constraint(greaterThanOrEqualTo: bottomAnchor, constant: paddingBottom).isActive = true
    }
  }
}
