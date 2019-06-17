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
    var savedText = ""
    
    var onSaveComment: ((_ data: String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.borderWidth = 1
        commentTextView.layer.cornerRadius = 6
        commentTextView.layer.borderColor = UIColor.lightGray.cgColor
        
        holdView.layer.cornerRadius = 6
        holdView.layer.borderWidth = 1
        holdView.layer.borderColor = UIColor.lightGray.cgColor

        // Do any additional setup after loading the view.
        if !savedText.isEmpty {
            commentTextView.text = savedText
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func saveAndCloseButtonPressed(_ sender: Any) {
        onSaveComment?(commentTextView.text!)
        dismiss(animated: true)
    }
    
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        onSaveComment?(commentTextView.text!)
        dismiss(animated: true)
    }
}
