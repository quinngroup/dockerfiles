# Configures a Docker image for the base IPython parallel cluster.

FROM magsol/anaconda
MAINTAINER Shannon Quinn "magsol@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Create the parallel profile.
RUN ipython profile create --parallel --profile=default
