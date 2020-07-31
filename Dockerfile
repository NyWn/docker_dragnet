FROM ubuntu:trusty

RUN apt-get update && apt-get install -y \
libatlas-base-dev libatlas-dev libblas-dev liblapack-dev libxslt-dev libxml2-dev gcc g++ curl

# WORKDIR /usr/src/app/
# RUN APPDIR=/usr/src/app/
# RUN ls
RUN curl https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh -o "miniconda.sh"
# RUN ls
RUN chmod 777 miniconda.sh
RUN /bin/bash miniconda.sh -b
# RUN ls /
RUN rm miniconda.sh
# RUN ls /*
ENV PATH="/root/miniconda2/bin:$PATH"
# RUN echo "$PATH"
# RUN ls /
# RUN ls /miniconda2/bin
ENV conda_deps='pip numpy scipy'
RUN conda create -m -p $HOME/py --yes $conda_deps python=2.7
ENV PATH=$HOME/py/bin:$PATH

RUN echo "export PATH=$PATH" >> $HOME/.bashrc
RUN echo "cd /usr/src/app" >> $HOME/.bashrc

# # WORKDIR /usr/src/app/
# RUN pip install "Cython>=0.21.1"
# RUN pip install -r requirements.txt

# RUN make install