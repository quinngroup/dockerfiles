# Installs caffe.

FROM magsol/opencv
MAINTAINER Shannon Quinn "magsol@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update
RUN apt-get -y install libprotobuf-dev vim

# Install protobuf.
RUN pip install protobuf

# Install Caffe.
RUN git clone https://github.com/BVLC/caffe.git opt/caffe && mkdir opt/caffe/caffe_build
WORKDIR opt/caffe/caffe_build
RUN cmake .. -DCMAKE_BUILD_TYPE=Release && make all -j && make runtest

# Pull down the model.
RUN wget http://dl.caffe.berkeleyvision.org/bvlc_googlenet.caffemodel && \
    mv bvlc_googlenet.caffemodel ../models/bvlc_googlenet/

ENV PYTHONPATH opt/caffe/python
WORKDIR /

# Add the models and images.
ADD models/ /models/
ADD images/ /images/
ADD deepdream.py /deepdream.py
