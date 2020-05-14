//
//  CustomButton.swift
//  NewCityLife
//
//  Created by Christian Mansch on 18.06.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    let customColor = UIColor(red: 120/255, green: 54/255, blue: 240/255, alpha: 1)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        //layer.cornerRadius = frame.size.height / 2
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = customColor.cgColor
        setTitleColor(.white, for: .normal)
        backgroundColor = customColor
        titleLabel?.font = UIFont(name: "Arial", size: 17)
    }
    
}
