#!/bin/bash
set -e # Exit immediately if any command fails

python install_jobrunner.py

# Run the jobrunner module
python -m datoma_jobrunner