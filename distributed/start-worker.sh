#!/bin/bash
# Another nice piece of work from ogrisel: count the number of CPUs, set
# the number of Python processes to the number of CPU cores, then set the
# number of threads to 1. Yes, bypass the GIL.

NCPUS=`python -c "import multiprocessing as mp; print(mp.cpu_count())"`
dworker scheduler:8786 --name worker --nthreads 1 --nprocs $NCPUS
