### Omar-OpenCV: Open Source Computer Vision Library

### About
A lightweight OpenCV 3.2 distrubtion to include only modules required by Ossim/Omar. In addition it includes nonfree library by default.

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
* Start up CMake and point the source code to the head directory
* Point the build folder to the desired location and click configure
* If your desire is to build Shared Libraries, make sure that the option BUILD_SHARED_LIBS is selected
* Set any additional options as desired and click configure again
* Click generate to make the Makefile
* Change to the directory that you set the binaries to build in from the second step in a terminal
* Run make and then make install

#### Known bug with highgui in Apple configuration. Deselect BUILD_opencv_highgui if this occurs 
