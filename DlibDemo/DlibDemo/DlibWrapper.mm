//
//  DlibWrapper.m
//  DlibDemo
//
//  Created by thanhns on 10/31/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

#import "DlibWrapper.h"
#import <UIKit/UIKit.h>

#import <dlib/image_processing.h>
#import <dlib/image_io.h>

@interface DlibWrapper()

@property (assign) BOOL prepared;

@end

@implementation DlibWrapper {
    dlib::shape_predictor shape_predictor;
}

// Initializer
- (instancetype)init {
    self = [super init];
    if (self) {
        _prepared = NO;
    }
    return self;
}

// Prepare shape predictor
- (void)prepare {
    NSString *modelFileName = [[NSBundle mainBundle] pathForResource:@"shape_predictor_68_face_landmarks" ofType:@"dat"];
    std::string modelFileNameCString = [modelFileName UTF8String];
    
    dlib::deserialize(modelFileNameCString) >> shape_predictor;
    
    self.prepared = YES;
}

- (void)doWorkOnSampleBuffer:(CMSampleBufferRef)sampleBuffer inRects:(NSArray<NSValue *> *)rects {
    
    if (!self.prepared) {
        [self prepare];
    }
    
    dlib::array2d<dlib::bgr_pixel> dlibImg;
    
    // MARK: magic
    CVImageBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    CVPixelBufferLockBaseAddress(imageBuffer, kCVPixelBufferLock_ReadOnly);
    
    size_t width = CVPixelBufferGetWidth(imageBuffer);
    size_t height = CVPixelBufferGetHeight(imageBuffer);
    char *baseBuffer = (char *)CVPixelBufferGetBaseAddress(imageBuffer);
    
    // set_size expects rows, cols format
    dlibImg.set_size(height, width);
    
    // copy samplebuffer image data into dlib image format
    dlibImg.reset();
    long position = 0;
    while (dlibImg.move_next()) {
        dlib::bgr_pixel& pixel = dlibImg.element();
        
        // assuming bgra format here
        long bufferLocation = position * 4; //(row * width + column) * 4;
        char b = baseBuffer[bufferLocation];
        char g = baseBuffer[bufferLocation + 1];
        char r = baseBuffer[bufferLocation + 2];
        
        dlib::bgr_pixel newpixel(b, g, r);
        // pixel = dlib::bgr_pixel(b, g, r);
        pixel = newpixel;
        position++;
    }
    
    // unlock buffer again until we need it again
    CVPixelBufferUnlockBaseAddress(imageBuffer, kCVPixelBufferLock_ReadOnly);
    
    // std::vector<dlib::rectangle> dets = detector(img);
    // convert the face bounds list to dlib format
    std::vector<dlib::rectangle> convertedRectangles = [DlibWrapper convertCGRectValueArray:rects];
    
    // for every detected face, compute face points using dlib
    for (unsigned long j = 0; j < convertedRectangles.size(); ++j)
    {
        dlib::rectangle oneFaceRect = convertedRectangles[j];
        
        // detect all landmarks
        dlib::full_object_detection shape = shape_predictor(dlibImg, oneFaceRect);
        
        // and draw them into the image (samplebuffer)
        for (unsigned long k = 0; k < shape.num_parts(); k++) {
            dlib::point p = shape.part(k);
            draw_solid_circle(dlibImg, p, 3, dlib::rgb_pixel(0, 255, 255));
        }
    }
    
    // lets put everything back where it belongs
    CVPixelBufferLockBaseAddress(imageBuffer, 0);
    
    // copy dlib image data back into samplebuffer
    dlibImg.reset();
    position = 0;
    while (dlibImg.move_next()) {
        dlib::bgr_pixel& pixel = dlibImg.element();
        
        // assuming bgra format here
        long bufferLocation = position * 4; //(row * width + column) * 4;
        baseBuffer[bufferLocation] = pixel.blue;
        baseBuffer[bufferLocation + 1] = pixel.green;
        baseBuffer[bufferLocation + 2] = pixel.red;
        
        position++;
    }
    CVPixelBufferUnlockBaseAddress(imageBuffer, 0);
}

/**
 * The method convertCGRectValueArray converts image bounds to dlib rect.
 * You can map and render these points on the image. Using these points,
 * we can find the distance between face points which we can use it for
 * overlay objects.
 */
+ (std::vector<dlib::rectangle>)convertCGRectValueArray:(NSArray<NSValue *> *)rects {
    std::vector<dlib::rectangle> myConvertedRects;
    for (NSValue *rectValue in rects) {
        CGRect rect = [rectValue CGRectValue];
        long left = rect.origin.x;
        long top = rect.origin.y;
        long right = left + rect.size.width;
        long bottom = top + rect.size.height;
        dlib::rectangle dlibRect(left, top, right, bottom);
        
        myConvertedRects.push_back(dlibRect);
    }
    return myConvertedRects;
}


@end
