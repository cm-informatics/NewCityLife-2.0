//
//  UIViewExtension.swift
//  NewCityLife
//
//  Created by Christian Mansch on 14.08.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

extension UIView {
    func addRoundedCorners(radius: CGFloat = 5) {
        layer.cornerRadius = radius
    }
}
