//
//  ViewController.swift
//  FaceDetectionCoreImage
//
//  Created by thanhns on 10/30/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit
import CoreImage

class ViewController: UIViewController {

    @IBOutlet weak var personPic: UIImageView!
    @IBOutlet weak var detectLabel: UILabel!
    
    private lazy var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        personPic.image = UIImage(named: "face-2.jpg")
        
        detect()
    }
    
    @IBAction func takePhoto(_ sender: UIButton) {
        present(imagePicker, animated: true, completion: nil)
    }
    
    func detect() {
        
        guard let personciImage = CIImage(image: personPic.image!) else { return }
        
        let accuracy = [CIDetectorAccuracy: CIDetectorAccuracyHigh]
        let faceDetector = CIDetector(ofType: CIDetectorTypeFace, context: nil, options: accuracy)
        let faces = faceDetector?.features(in: personciImage)
        
        // For converting the Core Image coordinates to UIView coordinates
        let ciImageSize = personciImage.extent.size
        var transform = CGAffineTransform(scaleX: 1, y: -1)
        transform = transform.translatedBy(x: 0, y: -ciImageSize.height)
        
        for face in faces as! [CIFaceFeature] {
            print("Found bounds are \(face.bounds)")
            
            // Apply the transform to convert the coordinates
            var faceViewBounds = face.bounds.applying(transform)
            
            // Calculate the actual positon and size of the rectangle in the image view
            let viewSize = personPic.bounds.size
            let scale = min(viewSize.width / ciImageSize.width,
                            viewSize.height / ciImageSize.height)
            let offsetX = (viewSize.width - ciImageSize.width*scale) / 2
            let offsetY = (viewSize.height - ciImageSize.height*scale) / 2
            
            faceViewBounds = faceViewBounds.applying(CGAffineTransform(scaleX: scale, y: scale))
            faceViewBounds.origin.x += offsetX
            faceViewBounds.origin.y += offsetY
            
            let faceBox = UIView(frame: faceViewBounds)
            
            faceBox.layer.borderWidth = 3
            faceBox.layer.borderColor = UIColor.yellow.cgColor
            faceBox.backgroundColor = UIColor.clear
            personPic.addSubview(faceBox)
        }
    }
}
