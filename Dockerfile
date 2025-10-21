FROM public.ecr.aws/docker/library/python:3.11 AS builder

# Install Python packages
RUN pip install networkx && pip install numpy

COPY datomaconfig.yml /app/
COPY test.py /app/
COPY results /app/results

# Necessary files
COPY install_jobrunner.py /app/install_jobrunner.py
RUN chmod +x /app/install_jobrunner.py
COPY install_jobrunner_and_run.sh /app/install_jobrunner_and_run.sh
RUN chmod +x /app/install_jobrunner_and_run.sh

WORKDIR /app
ENTRYPOINT ["/bin/bash" ,"/app/install_jobrunner_and_run.sh" ]
