#!/bin/bash

docker build . \
             -f Dockerfile/Dockerfile \
             -t x64/dagm:latest 
