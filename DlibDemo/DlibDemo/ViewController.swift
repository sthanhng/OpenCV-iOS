//
//  ViewController.swift
//  DlibDemo
//
//  Created by thanhns on 10/31/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let sessionHandler = SessionHandler()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        sessionHandler.openSession()
        
        let layer = sessionHandler.layer
        //        let previewLayer = AVCaptureVideoPreviewLayer()
        layer.frame = view.frame
        view.layer.addSublayer(layer)
        //        layer.frame = preview.bounds
        
        //        preview.layer.addSublayer(layer)
        
        view.layoutIfNeeded()
        
    }
    
}
