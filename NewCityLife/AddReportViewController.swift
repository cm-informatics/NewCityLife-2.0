//
//  AddReportViewController.swift
//  NewCityLife
//
//  Created by Christian Mansch on 14.08.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit

class AddReportViewController: UIViewController{

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var categoryTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popupView.addRoundedCorners()
        let doneButton = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 30))
        doneButton.titleLabel?.textAlignment = .left
        doneButton.setTitleColor(.blue, for: .normal)
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = .lightGray
        doneButton.addTarget(self, action: #selector(doneAction), for: .touchUpInside)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        
        categoryTextField.inputView = datePicker
        categoryTextField.inputAccessoryView = doneButton
        // Do any additional setup after loading the view.
    }
    
    @objc func doneAction() {
        //view.endEditing(true)
        categoryTextField.resignFirstResponder()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
