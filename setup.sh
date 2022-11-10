#!/bin/sh


# Usage: ./setup.sh
#
#
# Description: This script can be used to set up the galaxy
# web application.

. ./scripts/common_startup_functions.sh

parse_common_args $@

run_common_start_up

setup_python

python ./scripts/manage_tool_dependencies.py init_if_needed
