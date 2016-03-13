# Galaxy - Protease Prediction

FROM bgruening/galaxy-stable:16.01

MAINTAINER Björn A. Grüning, bjoern.gruening@gmail.com

ENV GALAXY_CONFIG_BRAND="Protease Prediction" \
    GALAXY_CONFIG_CONDA_ENSURE_CHANNELS=r,bioconda,bgruening \
    GALAXY_CONFIG_CONDA_AUTO_INSTALL=True \
    GALAXY_CONFIG_CONDA_DEBUG=True \
    GALAXY_CONFIG_CONDA_AUTO_INIT=True \
    GALAXY_CONFIG_DEFAULT_JOB_SHELL=/bin/bash \
    GALAXY_CONFIG_CLEANUP_JOB=never

RUN add-tool-shed --url 'https://testtoolshed.g2.bx.psu.edu/' --name 'Test Tool Shed'

ADD protease_prediction.yaml $GALAXY_ROOT/tools.yaml
RUN install-tools $GALAXY_ROOT/tools.yaml
