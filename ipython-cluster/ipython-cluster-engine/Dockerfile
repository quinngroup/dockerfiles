# Engine for the IPython cluster.

FROM magsol/ipython-cluster-base
MAINTAINER Shannon Quinn "magsol@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

# Add the json file.
ADD ../runtime/security/ipcontroller-engine.json /root/.ipython/profile_default/security/

# Start the engine. Modify this bash file if you want to change how
# the engine is started.
ADD start-engine.sh /start-engine.sh
RUN chmod +x /start-engine.sh
CMD ["/start-engine.sh"]
