#!/bin/bash

# Just run the testing script we already dropped into the image
docker exec -it docker_lrs /bin/test-lrs.sh
