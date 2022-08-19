FROM nvcr.io/nvidia/l4t-tensorrt:r8.4.0-runtime
USER root
WORKDIR /workplace
COPY yolo/ ./yolo/
COPY utils/ ./utils/
COPY ./trt_yolo.py .
RUN echo hello
CMD ["echo", "hello-world"]
 