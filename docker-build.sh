#!/usr/bin/bash

# Build using the pop-build docker image. Explanation of arguments:
# 
#   run    Instructs docker to run something: "/project/build.sh"
#   -it    Interactive terminal mode. Provides a better terminal experience, colors, etc.
#   --rm   Delete container when done. Otherwise containers will pile up.
#   -v     Mount volume, current dir: . will be mounted as /project inside the container
#   -w     Set working directory

set -e

docker run -it --rm -v ".:/project" -w "/project" pop-build "/project/build.sh"
