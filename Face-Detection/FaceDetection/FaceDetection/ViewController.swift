//
//  ViewController.swift
//  FaceDetection
//
//  Created by thanhns on 10/30/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    // Image Controller
    private lazy var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
    }
    
    @IBAction func captureTouch(_ sender: Any) {
        present(imagePicker, animated: true)
    }
    
    // Classify image function
    func classifyImage() {
        let image = OpenCVWrapper.classifyImage(imageView.image!)
        
        if (image != nil) {
            imageView.image = image
        } 
    }
}

extension ViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        classifyImage()
        
        dismiss(animated: true, completion: nil)
    }
}

