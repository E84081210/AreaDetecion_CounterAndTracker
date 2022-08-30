FROM nvcr.io/nvidia/l4t-jetpack:r35.1.0
USER root
WORKDIR /workplace
COPY ./yolo/ ./yolo/
COPY ./utils/ ./utils/
COPY ./plugins/ ./plugins/
COPY ["trt_yolo.py", "rtsp.sh", "/workplace/"]
RUN apt-get update \
    && echo "Install software-properties-common" \
    && echo "=========================================" \
    && apt-get install software-properties-common -qqy \

    && echo "Install ppa:deadsnakes/ppa" \
    && echo "=========================================" \
    && add-apt-repository ppa:deadsnakes/ppa

RUN echo "Install Python3.8 package" \
    && echo "=========================================" \
    && apt install python3.8-dev -qqy \
    && apt install python3.8-distutils -qqy \

    && echo "Install pip3" \
    && echo "=========================================" \
    && pip3 install --upgrade pip 

RUN apt-get update \
    && echo "Install numpy and protobuf" \
    && echo "=========================================" \
    && pip3 install numpy --upgrade -qq \
    && pip3 install protobuf==3.8.0 -qq \

    && echo "Install opencv-python" \
    && echo "=========================================" \
    && pip3 install opencv-python -qq \ 

    && echo "Install Pycuda 2019.1.2 and ONNX" \
    && echo "=========================================" \
    && pip3 install pycuda==2019.1.2 \
    && pip3 install onnx 

CMD ["bin/bash"]
