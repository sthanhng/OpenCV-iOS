# Face detection with OpenCV, Core Image, and Vision

* Create data: 2018-10-30

## Getting started

One of the most important processes involved in Face Recognition is how accurately you detect faces located in any scene. This is why it is really important to decide what framework should we use for Face detection when we are planning to create an iOS app.

In this tutorial, we tried to compare performance of the most popular frameworks (OpenCV, Core Image, and Vision) used in iOS for Face detection.

## [OpenCV](https://opencv.org/about.html)

OpenCV is an open source Computer Vision and Machine Learning library.

## [Core Image](https://developer.apple.com/)

Core Image is an image processing and analysis technology that provides high-performance processing for still and video images. Use the many built-in image filters to process images and build complex effects by chaining filters.

It operates on image data types from the Core Graphics, Core Video, and Image I/O frameworks, using either a GPU or CPU rendering path. For details, see [here](https://developer.apple.com/documentation/coreimage).


## [Vision](https://machinelearning.apple.com)

Apply high-performance image analysis and computer vision techniques to identify faces, detect features, and classify scenes in images and video.

## Face detection with OpenCV

Since OpenCV is built on C++ you can't call its functions directly from Swift.

![Imgur](assets/ios_opencv_swift.png)

Credit: [iOS -- OpenCV and Swift](https://medium.com/@borisohayon/ios-opencv-and-swift-1ee3e3a5735b)

OpenCV uses Haar Cascade Classifier to detect face from `MAT Image` by locating the Haar Cascade for frontal face. To detect faces using OpenCV, you need to follow the below steps:

* Create the Haar Cascade classifier by loading the `haarcascade_frontalface_alt2.xml` file.

