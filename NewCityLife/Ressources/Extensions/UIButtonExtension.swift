//
//  UIButtonExtension.swift
//  NewCityLife
//
//  Created by Christian Mansch on 14.08.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

extension UIButton {
    func createFloatingActionButton() {
        backgroundColor = .red
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
