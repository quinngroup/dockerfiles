# Installs Python (with Anaconda) and the latest version of OpenCV with
# Python bindings.

FROM magsol/cuda
MAINTAINER Shannon Quinn "magsol@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

ENV ANACONDA_VERSION 2.3.0
ENV OPENCV_VERSION 3.0.0

RUN apt-get -y update
RUN apt-get -y install cmake git libgtk2.0-dev pkg-config libavcodec-dev \
    libavformat-dev libswscale-dev libtbb2 libtbb-dev libtiff5-dev wget \
    libjasper-dev libdc1394-22-dev unzip libblas-dev liblapack-dev

# Install Anaconda.
RUN echo 'export PATH=/opt/conda/bin:$PATH' > conda.sh && mv conda.sh /etc/profile.d/
RUN wget https://repo.continuum.io/archive/Anaconda-$ANACONDA_VERSION-Linux-x86_64.sh
RUN /bin/bash /Anaconda-$ANACONDA_VERSION-Linux-x86_64.sh -b -p /opt/conda && \
    rm /Anaconda-$ANACONDA_VERSION-Linux-x86_64.sh
ENV PATH /opt/conda/bin:$PATH
RUN conda update -y --all

# Now that Python is set up, install OpenCV.
RUN wget https://github.com/Itseez/opencv/archive/$OPENCV_VERSION.zip && \
    unzip $OPENCV_VERSION.zip && rm $OPENCV_VERSION.zip && \
    mkdir opencv-$OPENCV_VERSION/build
WORKDIR opencv-$OPENCV_VERSION/build/
RUN cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/opt/opencv \
    -D PYTHON2_EXECUTABLE=/opt/conda/bin/python \
    -D PYTHON2_INCLUDE_DIR=/opt/conda/include/python2.7 \
    -D PYTHON2_INCLUDE_DIR2=/opt/conda/include/python2.7 \
    -D PYTHON2_LIBRARY=/opt/conda/lib/libpython2.7.so \
    -D PYTHON2_NUMPY_INCLUDE_DIRS=/opt/conda/lib/python2.7/site-packages/numpy/core/include \
    -D PYTHON2_PACKAGES_PATH=/opt/conda/lib/python2.7/site-packages \
    -D PYTHON_INCLUDE_DIR=/opt/conda/include/python2.7 \
    -D PYTHON_INCLUDE_DIR2=/opt/conda/include/python2.7 \
    -D PYTHON_LIBRARY=/opt/conda/lib/libpython2.7.so \
    ..
RUN make -j && make install
WORKDIR /
RUN rm -rf opencv-$OPENCV_VERSION
ENV PATH /opt/opencv:$PATH
