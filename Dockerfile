# Base Image will be as below
FROM ubuntu:20.04
ARG SDLC_ARG
ENV SDLC_ENV=${SDLC_ARG}
RUN apt-get update && apt-get install awscli -y
RUN awscli --version
RUN echo "ARG value for SDLC_ARG is $SDLC_ARG"
RUN echo "ENV value for SDLC_ENV is $SDLC_ENV"
