//
//  CameraService.swift
//  NewCityLife
//
//  Created by Christian Mansch on 10.07.19.
//  Copyright © 2019 Christian.Mansch. All rights reserved.
//

import UIKit
import AVFoundation

class CameraService: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //var dismissImagePickerController: ((_ data: String) -> ())?
    var dismissImagePickerController: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        print(selectedImage)
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissImagePickerController?()
        //dismiss(animated: true, completion: nil) <-- Hat keine Wirkung
    }
}
