FROM nvcr.io/nvidia/l4t-jetpack:r35.1.0
USER root
WORKDIR /workplace
COPY yolo/ ./yolo/
COPY utils/ ./utils/

WORKDIR /workplace/yolo
RUN apt-get install python3-pip -y \
    && pip3 install --upgrade pip
RUN pip3 install --upgrade pip \
    && pip3 install protobuf==3.8.0 \
    && pip3 install pycuda
RUN python3 -m pip install onnx==1.9.0 \
    && pip3 install opencv-python 

CMD ["bash", "-c", "echo", "Docker container has been activated", "&&", "/bin/bash"]

# 
# PyCUDA
#

# ENV PATH="/usr/local/cuda/bin:${PATH}"
# ENV LD_LIBRARY_PATH="/usr/local/cuda/lib64:${LD_LIBRARY_PATH}"
# RUN echo "$PATH" && echo "$LD_LIBRARY_PATH"
# RUN pip3 install --upgrade pip \
#     && python3 -m pip install python-dev-tools --user --upgrade \
#     && pip3 install pycuda --verbose

# COPY ["./trt_yolo.py", "./requirements.sh", "./rtsp.sh", "/workplace/"]
# RUN chmod +x *.sh \ 
#     && ./requirements.sh \
# CMD ["bash", "-c", "echo", "Docker container has been activated", "&&", "/bin/bash"]



