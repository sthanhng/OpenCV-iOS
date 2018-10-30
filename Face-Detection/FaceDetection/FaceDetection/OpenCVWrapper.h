//
//  OpenCVWrapper.h
//  FaceDetection
//
//  Created by thanhns on 10/30/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface OpenCVWrapper : NSObject

// Get version number
+(NSString *) versionNumber;

// Convert to grayscale
+(UIImage *) convertToGrayscale: (UIImage *) image;

+(UIImage *) classifyImage: (UIImage *) image;

@end

NS_ASSUME_NONNULL_END
