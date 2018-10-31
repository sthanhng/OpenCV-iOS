//
//  DrawFacialFeatures.swift
//  FaceDetection
//
//  Created by thanhns on 10/31/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

import Foundation

func addFaceLandmarksToImage(_ face: VNFaceObservation) {
    UIGraphicsBeginImageContextWithOptions(image.size, true, 0.0)
    let context = UIGraphicsGetCurrentContext()
    
    // draw the image
    image.draw(in: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
    
    context?.translateBy(x: 0, y: image.size.height)
    context?.scaleBy(x: 1.0, y: -1.0)
    
    // draw the face rect
    let w = face.boundingBox.size.width * image.size.width
    let h = face.boundingBox.size.height * image.size.height
    let x = face.boundingBox.origin.x * image.size.width
    let y = face.boundingBox.origin.y * image.size.height
    let faceRect = CGRect(x: x, y: y, width: w, height: h)
    context?.saveGState()
    context?.setStrokeColor(UIColor.red.cgColor)
    context?.setLineWidth(8.0)
    context?.addRect(faceRect)
    context?.drawPath(using: .stroke)
    context?.restoreGState()
    
    // face contour
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.faceContour {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // outer lips
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.outerLips {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // inner lips
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.innerLips {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // left eye
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.leftEye {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // right eye
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.rightEye {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // left pupil
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.leftPupil {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // right pupil
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.rightPupil {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // left eyebrow
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.leftEyebrow {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // right eyebrow
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.rightEyebrow {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // nose
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.nose {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.closePath()
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // nose crest
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.noseCrest {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // median line
    context?.saveGState()
    context?.setStrokeColor(UIColor.yellow.cgColor)
    if let landmark = face.landmarks?.medianLine {
        for i in 0...landmark.pointCount - 1 { // last point is 0,0
            let point = landmark.point(at: i)
            if i == 0 {
                context?.move(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            } else {
                context?.addLine(to: CGPoint(x: x + CGFloat(point.x) * w, y: y + CGFloat(point.y) * h))
            }
        }
    }
    context?.setLineWidth(8.0)
    context?.drawPath(using: .stroke)
    context?.saveGState()
    
    // get the final image
    let finalImage = UIGraphicsGetImageFromCurrentImageContext()
    
    // end drawing context
    UIGraphicsEndImageContext()
    
    imageView.image = finalImage
}
