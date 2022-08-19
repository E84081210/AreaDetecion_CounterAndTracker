FROM nvcr.io/nvidia/l4t-tensorrt:r8.4.0-runtime
USER root
WORKDIR /workplace
COPY yolo/ ./yolo/
COPY utils/ ./utils/
COPY ["./trt_yolo.py", "./requirements.sh", "./rtsp.sh", "/workplace/"]
RUN chmod +x *.sh \ 
    && ./requirements.sh \
CMD ["bash", "-c", "echo", "Docker container has been activated", "&&", "/bin/bash"]



