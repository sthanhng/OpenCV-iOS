//
//  TakePhoto.swift
//  FaceDetection
//
//  Created by thanhns on 10/31/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import Foundation

@IBAction func onTapTakePhoto(sender: AnyObject) {
    self.showAlertChoosePhoto()
}

func showAlertChoosePhoto() {
    
    let optionMenu = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    let takePhotoAction = UIAlertAction(title: "Take photo", style: .default, handler: {
        (alert: UIAlertAction!) -> Void in
        self.showImagePicker(sourceType: .camera)
    })
    
    let getFromAlbumAction = UIAlertAction(title: "From photo album", style: .default, handler: {
        (alert: UIAlertAction!) -> Void in
        self.showImagePicker(sourceType: .photoLibrary)
    })
    
    let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
        (alert: UIAlertAction!) -> Void in
    })
    
    optionMenu.addAction(takePhotoAction)
    optionMenu.addAction(getFromAlbumAction)
    optionMenu.addAction(cancelAction)
    
    self.present(optionMenu, animated: true, completion: nil)
}

func showImagePicker(sourceType:UIImagePickerControllerSourceType) {
    if (UIImagePickerController.isSourceTypeAvailable(sourceType)) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
    }
}

//
extension DetectImageViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = image
        }
    }
}
