//
//  DlibWrapper.h
//  DlibDemo
//
//  Created by thanhns on 10/31/18.
//  Copyright © 2018 Thanh Nguyen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreMedia/CoreMedia.h>

NS_ASSUME_NONNULL_BEGIN

@interface DlibWrapper : NSObject

- (instancetype)init;
- (void)doWorkOnSampleBuffer:(CMSampleBufferRef)sampleBuffer inRects:(NSArray<NSValue *> *)rects;
- (void)prepare;

@end

NS_ASSUME_NONNULL_END
