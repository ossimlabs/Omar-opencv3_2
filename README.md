### OpenCV: Open Source Computer Vision Library

### About
This is a lightweight OpenCV 3.2 distribution to include only modules required by OSSIM. In addition it includes nonfree library by default.

#### Resources

* Homepage: <http://opencv.org>
* Docs: <http://docs.opencv.org/master/>
* Q&A forum: <http://answers.opencv.org>
* Issue tracking: <https://github.com/opencv/opencv/issues>

#### Included Modules

Core:
* core
* features2d
* flann
* highgui
* imgcodecs
* imgproc
* ml
* objdetect
* photo
* video
* xfeatures2d (From opencv_contrib repo)

CUDA:
* cudaarithm
* cudafeatures2d
* cudaimgproc
* cudaobjdetect
* cudastereo
* cudav

#### Disclaimer: Not all opencv compliant code will work with this version of opencv. Some modules have been removed to make the code more concise and in addition some features might be disabled in the included above modules because of such. 

### build process
Simply run `scripts/build.sh [<install-dir>]` 
If the install dir is omitted, the build will generate a "sandbox" installation under the `install` subdirectory under the repo's top directory.

### Jenkins
A Jenkins configuration script is available under the `scripts` directory. It will pull this repository down, build it, and generate an artifact of the sandbox install called `opencv-install.tgz`.

#### Known bug with highgui in Apple configuration. Deselect BUILD_opencv_highgui if this occurs 
