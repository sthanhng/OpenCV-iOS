# How to build Dlib on iOS

* Create date: 2018-10-31

## Gettting started

* Dlib is a modern C++ toolkit containing machine learning algorithms and tools for creating complex software in C++ to solve real world problems. It is used in many Computer vision and Machine learning applications. It can be used to detect facial landmarks such as eyes, lips, nose, etc which is how Snapchat lenses work.

* See [http://dlib.net](http://dlib.net) for the main project documentation and API references.

## Building Dlib

The process of building Dlib to an existing iOS project involves a bit of work so its important that one follows all the steps in order.

1. Download Dlib from [here](http://dlib.net/) and save it in a directory you can work from.

2. We will need to have CMake installed on our system. If you do not have CMake you can install it via Homebrew as below:
```bash
brew install cmake
```

3. Go into the examples folder inside the Dlib folder and create a new folder called `build`:
```bash
mkdir build && cd build
```

4. Build all the examples by running the following commands:
```bash
cmake -G Xcode ..
cmake --build . --config Realease
```

An Xcode project will be created under `build/dlib_build`. Now that we have Dlib built and setup lets start adding it to our iOS project.

## Adding Dlib to your iOS project

1. In the root of Xcode project create a folder called `lib`.

2. Copy the `libdlib.a` file from the dlib Xcode project and paste it into the `lib` folder.

3. Copy the `dlib` folder from the `dlib-19.16` folder and paste it into the `lib` folder.

4. Drag the `libdlib.a` file from the `lib` folder and drop it into your Xcode project.

## Configuration

In your Xcode project open `Build Settings` tab and add the following under `Library Search Paths`: `$(PROJECT_DIR)/lib`. This will let Xcode know where the Dlib files are.

Next you need to add some preprocessor macros to help Xcode compile the Dlib files properly.

```
DLIB_NO_GUI_SUPPORT
DLIB_JPEG_SUPPORT
NDEBUG
DLIB_USE_BLAS
DLIB_USE_LAPACK
```

Add the dependencies library

* Acceletrate.framework
* AssetsLibrary.framework
* AVFoundation.framework

## Examples

An example how to build Dlib and using it to detect facial landmarks on iOS can be found [here](https://github.com/sthanhng/OpenCV-iOS/tree/master/DlibDemo).

## References
