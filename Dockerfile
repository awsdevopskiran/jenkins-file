# Base Image will be as below
FROM ubuntu:20.04
ARG SDLC_ARG
ENV SDLC_ENV=${SDLC_ARG}
RUN sudo apt-get update -y
RUN sudo apt-get update && sudo apt install awscli
RUN echo "ARG value for SDLC_ARG is $SDLC_ARG"
RUN echo "ENV value for SDLC_ENV is $SDLC_ENV"
