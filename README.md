# AreaDetecion_CounterAndTracker

[![Yolov4](https://img.shields.io/badge/YOLOv4--TRT-AreaDetection-brightgreen)](https://github.com/E84081210/AreaDetecion_CounterAndTracker)
Pedestrian flow analysis with YOLOv4-TensorRT, reaching a combination of area detection and object tracker.
- Developing with NVIDIA Jetson platform is mandatory.
- This code is written for educational purposes.
- Design for scenarios such as company or street RTSP source.

#### Table of contents

- [Background](#background)

- [Background](#background)

- [Introduciton](#introduction)

    - [Features](#features)

    - [Methods](#methods)

    - [This example is for...](#this-example-is-for)

- [Prerequisite](#prerequisite)
    
- [Usage](#usage)

- [License](#license)

### Background
" AreaDetecion_CounterAndTracker " was originally inspired by [jkjung-avt/tensorrt_demos](https://github.com/jkjung-avt/tensorrt_demos), what I do is add more features to it. 

After browsing around GitHub, I can't find a further application based on him, or just too obscure for an internship like me, so I decided to write down my own one. 

The primary features are Tracker, Areadetecion, and Counter. Let's dive into it if you are interested.
1. Tracker: there are lots of built-in packages in OpenCV, leading to high-end device demand eventually. I adopt the simplest algorithm to raise the accuracy, which allows devices such as Jetson NANO with yolov3-tiny to operate smoothly. By the way, since we don't have a precise tracker, it's will be embarrassed if we label it with ID, so I decided to hide it.
2. AreaDetection: to reduce the burden on the device, if a person enters ignored area, it will not display bounding boxes or go through the calculation of tracker. On top of that, ignored area makes windows keep neat.
3. Counter: compared with the previous frame, we can easily tell whether "enter" or "entrance".

I still have tons of things to learn, considering code style and fundamental knowledge. It's would be nice if you share with me what or how to improve my work, so feel free to leave a comment or send a text to me, have a nice one ! --AntonyChiu

### Introduction

This example is particularly designed for flow counting, thus RTSP source is necessary. 

#### Features:

- AreaDetection

    - Target    : user define which area should focus on, i.e. where counter operates.

    - Ignore    : user define which area should be ignored.

- Counter

    - Exit & Entrance : classify whether the person is getting out or in the area.

    - FlowCount       : total flow count so far.

- Application(optional)

    - Once people enter the area, you can do things like send an email to host, open the door, alert on the screen, etc.

#### Methods

- Tracker

    - We will track objects via the change of central position, instead of using tracker from OpenCV, which is well optimized.

    - I also wrote a simple code about the foundation of tracker, check **tracker_demo.py** if you are interested.

- YOLOv4

    - Tracker needs the exact position of object, which means we have to apply object detection first.
- TensorRT

    - speed up the process. I recommend you taking a look at [NVIDIA's official website](https://developer.nvidia.com/tensorrt).

- Docker

    - Build the environment faster and automatically.  

### This example is for...

:heavy_check_mark: Want to learn object detection, OpenCV, and visualization and tracker.

:heavy_check_mark: Familiar with basic Python, especially class & object.

:heavy_check_mark: Read [jkjung-avt/tensorrt_demo](https://github.com/jkjung-avt/tensorrt_demos) beforehand is more than better.

:x: Looking for a deeper TensorRT lesson.

:x: Off-the-shelf product. The precision is about 90 %, and it will decrease in different scenarios.

:x: Without NIVIDA Jetson device.

#### Prerequisite

:zero: Update and upgrade your "pip3" and "apt-get" first
```shell
$ sudo apt-get update
$ sudo apt-get upgrade
$ pip3 install --upgrade pip
```

:one: Clone the repository
```shell
$ git clone https://github.com/E84081210/Innotect-humanDetection.git
```

:two: build Docker image. Check [this](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/) out if you never learned it before.
```shell
$ cd ${HOME}/Innotect-humanDetecion/
$ sudo docker build -t {name:tag}
$ sudo docker run {name:tag}
$ sudo docker exec -it {name:tag}
```

:raised_hands: __Back up plan__: If you meet some problem with Docker, you may also install packages manually.
| Package   | Version   | Note            |
| :----     | :---      | :---            |
| OpenCV    | 3.4.6     | latest is fine  |
| Protobuf  | 3.20      | upgrade Numpy   |
| Pycuda    | 2019.1.2  | take some time  |
| ONNX      | 1.9.0     |                 |

```shell
$ pip3 install opencv-python
$ pip3 install numpy --upgrade
$ pip3 install protobuf==3.20
$ pip3 install protobuf-compiler libprotoc-dev
$ pip3 install onnx=1.9.0
```

:three: Go to plugins file and build "yolo_layer" plugin. File with ".so" at the end would be generated. 
```shell
$ cd ${HOME}/Innotect-humanDetecion/plugins
$ make
```

:four: Download YOLOv4 model and convert it to ONNX and then to TensorRT engine. We take "yolov4-416" this time.
```shell
$ cd ${HOME}/Innotect-humanDetecion/yolo
$ ./download_yolo.s
$ python3 yolo_to_onnx.py -m yolov4-416
$ python3 onnx_to_tensorrt.py -m yolov4-416
```

The last step "onnx_to_tensorrt.py" takes about half an hour on my Jetson AGX Xavier.

:five: Final step: go to "rtsp.sh", and modify your RTSP ID and YOLO model name. Run ```chmod +x rtsp.sh``` avoiding shell script is denied by permission.
```shell
# rtsp.sh
!#/bin/bash

python3.8 trt_yolo.py -m yolov4-416 --rtsp {RTSP_ADDRESS}
```

### Usage

:one: It will take a little bit longer for the initial operation.
```shell
cd ${HOME}/Innotect-humanDetecion/
/rtsp.sh
```
```shell
預留
```

:two: Draw Target area, demanding at least three points. Press "C" to clean all points, "H" to show help message, and "Q" to continue.

Focus area will count and carry out commands such as open the door.

:three: Draw Ignore area, demanding at least three points. Press "C" to clean all points, "H" to show help message, and "Q" to continue.
__Congrats!__ 
result


### Licences

:star: Independence developer
1. [MaxChang](https://github.com/MaxChangInnodisk), my mentor, who brings me to the world of coding. You own my respect.
2. [jkjung-avt/tensorrt_demos](https://github.com/jkjung-avt/tensorrt_demos), 80% of my repository is based on it.
3. [saimj7/People-Counting-in-Real-Time](https://github.com/saimj7/People-Counting-in-Real-Time).
4. [Pysource](https://pysource.com) teaches me the foundation of tracker.
5. [TechWorld with Nana](https://www.youtube.com/watch?v=3c-iBn73dDE), the best Docker lesson of all time.

:star: Official 
1. [Docker document](https://docs.docker.com)
2. [NVIDIA TensorRT](https://github.com/NVIDIA/TensorRT)
3. [OpenCV document](https://docs.opencv.org/4.x/)

:star: This repository is under MIT License.