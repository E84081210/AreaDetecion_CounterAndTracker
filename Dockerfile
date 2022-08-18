FROM ubuntu
USER root
WORKDIR /workplace
COPY ./yolo/ ./yolo/
COPY ./utils/ ./utils/
