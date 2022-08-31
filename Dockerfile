FROM nvcr.io/nvidia/l4t-tensorrt:r8.4.0-runtime
USER root
WORKDIR /workplace
COPY ./yolo/ ./yolo/
COPY ./utils/ ./utils/
COPY ./plugins/ ./plugins/
COPY ["trt_yolo.py", "rtsp.sh", "/workplace/"]
RUN apt update \
    && echo "Install software-properties-common" \
    && echo -e "=========================================\n\n\n" \
    && apt install software-properties-common -qqy \

    && echo "Install ppa:deadsnakes/ppa" \
    && echo -e "=========================================\n\n\n" \
    && add-apt-repository ppa:deadsnakes/ppa

RUN echo "Install Python3.8 package" \
    && echo -e "=========================================\n\n\n" \
    && apt install python3.8-dev -qqy \
    && apt install python3.8-distutils -qqy \

    && echo "Install pip3 and pytool and wheel " \
    && echo -e "=========================================\n\n\n" \
    && pip3 install pip --upgrade -qq \
    && pip3 install pytool -qq \
    && pip3 install wheel --upgrade -qq

RUN apt update \
    && echo "Install numpy and protobuf" \
    && echo -e "=========================================\n\n\n" \
    && pip3 install numpy --upgrade -qq \
    && pip3 install protobuf==3.8.0 -qq \

    && echo "Install opencv-python" \
    && echo -e "=========================================\n\n\n" \
    && pip3 install opencv-python -qq \ 

    && echo "Install Pycuda 2019.1.2 and ONNX" \
    && echo -e "=========================================\n\n\n" \
    && pip3 install pycuda==2019.1.2 \
    && pip3 install onnx 

CMD ["bin/bash"]
