# Controller for the IPython cluster.

FROM magsol/ipython-cluster-base
MAINTAINER Shannon Quinn "magsol@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Start the controller. Modify this bash file if you want to change how
# the controller is started.
ADD start-controller.sh /start-controller.sh
RUN chmod +x /start-controller.sh
CMD ["/start-controller.sh"]
