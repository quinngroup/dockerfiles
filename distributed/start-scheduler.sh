#!/bin/bash
# Pretty straightforward--just fire up the distributed scheduler.
# Other options not used include:
# - bokeh-whitelist: IP addresses to whitelist (?)
# - http-port: HTTP serving port (same as --bokeh-port?)
dscheduler --port 8786 --host scheduler
