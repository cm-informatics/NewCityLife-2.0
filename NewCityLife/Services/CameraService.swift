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
    
    var dismissImagePickerController: ((_ image: UIImage?) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        dismissImagePickerController?(selectedImage)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismissImagePickerController?(nil)
    }
}
