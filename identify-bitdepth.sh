#!/bin/bash

docker run --rm \
    -v "$(pwd)/input:/input:ro" \
    -v "$(pwd)/output:/output" \
    kl4n4/tiff-identify-bitdepth \
    $1
