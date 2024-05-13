FROM ubuntu:24.04

RUN apt-get update && apt-get install -y git wget cmake build-essential 


# Install miniconda
RUN mkdir -p /opt/miniconda3
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-py311_23.10.0-1-Linux-x86_64.sh -O /opt/miniconda3/miniconda.sh
RUN bash /opt/miniconda3/miniconda.sh -b -u -p /opt/miniconda3
RUN rm -rf /opt/miniconda3/miniconda.sh
RUN /opt/miniconda3/bin/conda init bash
RUN /opt/miniconda3/bin/conda init zsh


# Install dependencies
COPY tudat-bundle/environment.yaml environment.yaml
RUN /opt/miniconda3/bin/conda env create -f environment.yaml



