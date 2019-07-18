//
//  CommentViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 08.06.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class CommentViewController: UIViewController {

    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var holdView: UIView!
    @IBOutlet weak var saveAndCloseButton: UIButton!
    var savedText = ""
    
    var onSaveComment: ((_ data: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        styleViews(views: [holdView, commentTextView, saveAndCloseButton])
        commentTextView.text = savedText
    }
    
    func styleViews(views: [UIView]) {
        for view in views {
            view.layer.cornerRadius = 6
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    @IBAction func saveAndCloseButtonPressed(_ sender: Any) {
        onSaveComment?(commentTextView.text!)
        dismiss(animated: true)
    }
}
