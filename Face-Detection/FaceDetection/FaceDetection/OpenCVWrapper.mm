//
//  OpenCVWrapper.m
//  FaceDetection
//
//  Created by thanhns on 10/30/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

#ifdef __cplusplus
#include <opencv2/opencv.hpp>
#endif

#import <opencv2/opencv.hpp>
#import <opencv2/imgcodecs/ios.h>
#import "OpenCVWrapper.h"


@implementation OpenCVWrapper

// Get version number
+(NSString *) versionNumber {
    return [NSString stringWithFormat:@"OpenCV %s", CV_VERSION];
}

#pragma mark - Conver to grayscale
+(UIImage *) convertToGrayscale:(UIImage *)image {
    cv::Mat imageMat;
    UIImageToMat(image, imageMat);
    
    if (imageMat.channels() == 1) return image;
    
    // Transform
    cv::Mat grayMat;
    cv::cvtColor(imageMat, grayMat, CV_BGR2GRAY);
    
    // Convert to UIImage
    return MatToUIImage(grayMat);
}

#pragma mark - Detect Image
+(UIImage *) classifyImage:(UIImage *)image {
    // Convert UIImage to CV Mat
    cv::Mat colorMat;
    UIImageToMat(image, colorMat);
    
    // Convert to grayscale
    cv::Mat grayMat;
    cv::cvtColor(colorMat, grayMat, CV_BGR2GRAY);
    
    // Load detector from file
    cv::CascadeClassifier classifier;
    const NSString* cascadePath = [[NSBundle mainBundle] pathForResource:@"haarcascade_frontalface_alt2" ofType:@"xml"];
    classifier.load([cascadePath UTF8String]);
    
    // Initialize vars for classifier
    std::vector<cv::Rect> detections;
    
    const double scalingFactor = 1.1;
    const int minNeightbors = 2;
    const int flags = 0;
    const cv::Size minimumSize(300, 300);
    
    // Classify functions
    classifier.detectMultiScale(grayMat, detections, scalingFactor, minNeightbors, flags, minimumSize);
    
    // If no detections found, return nil
    if (detections.size() <= 0) {
        return nil;
    }
    
    // Loop through detections
    for (auto &face : detections) {
        const cv::Point tl(face.x, face.y);
        const cv::Point br = tl + cv::Point(face.width, face.height);
        const cv::Scalar color = cv::Scalar(0, 255, 0);
        
        cv::rectangle(colorMat, tl, br, color, 4, 8, 0);
    }
    
    return MatToUIImage(colorMat);
}

@end
