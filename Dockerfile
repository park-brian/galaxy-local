FROM ubuntu:latest

RUN apt update \
 && apt install -y \
    curl \
    git \
    gpg \
    python-is-python3 \
    python3 \
    python3-venv \
 && apt clean

RUN curl https://repo.anaconda.com/pkgs/misc/gpgkeys/anaconda.asc | gpg --dearmor > conda.gpg \
 && install -o root -g root -m 644 conda.gpg /usr/share/keyrings/conda-archive-keyring.gpg \
 && gpg --keyring /usr/share/keyrings/conda-archive-keyring.gpg --no-default-keyring --fingerprint 34161F5BF5EB1D4BFBBB8F0A8AEB4F8B29D82806 \
 && echo "deb [arch=amd64 signed-by=/usr/share/keyrings/conda-archive-keyring.gpg] https://repo.anaconda.com/pkgs/misc/debrepo/conda stable main" > /etc/apt/sources.list.d/conda.list \
 && apt update \
 && apt install -y conda

ENV GALAXY_DIR=/galaxy

ENV GALAXY_USER=galaxy

RUN adduser --system --group $GALAXY_USER \
 && mkdir -p $GALAXY_DIR \
 && chown $GALAXY_USER:$GALAXY_USER $GALAXY_DIR -R

RUN apt install -y bzip2

USER $GALAXY_USER

WORKDIR $GALAXY_DIR

ENV GALAXY_VERSION=22.05

RUN git clone -b release_${GALAXY_VERSION} https://github.com/galaxyproject/galaxy.git $GALAXY_DIR


COPY setup.sh setup.sh

RUN sh setup.sh

CMD sh run.sh