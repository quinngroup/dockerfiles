#!/bin/bash
# This script handles starting the IPython cluster controller. If there are
# any options you want to set, this would be the place.

ipcontroller \
    --ip="*" \
    --log-to-file \
    --log-level=DEBUG \
    --reuse
