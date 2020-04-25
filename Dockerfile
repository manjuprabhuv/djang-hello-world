FROM python:3.8.1-slim-buster

ENV COLUMNS=80

RUN apt -y update && apt install -y \
    apt-transport-https \
    build-essential \
    curl \
    dtach \
    git \
    htop \
    iotop \
    netcat \
    software-properties-common \
    vim

RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo "deb https://deb.nodesource.com/node_13.x buster main" >> /etc/apt/sources.list.d/extra.list && \
    # Added for the dev packages
    curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" >> /etc/apt/sources.list.d/extra.list && \
    apt update -y && \
    apt install -y \
    gdal-bin \
    gettext \
    libgeos-dev \
    libpng-dev \
    libjpeg-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    nodejs \
    postgresql-server-dev-9.6 \
    python-dev \
    python-pip \
    python-setuptools \
    tzdata \
    zlib1g


RUN python3 -m venv /srv/venv && mkdir /srv/web

ENV HOME=/srv/
COPY ./manage.py /srv/web/manage.py
COPY ./requirements.txt /srv/web/requirements.txt
COPY ./hello /srv/web/hello
COPY ./helloworld /srv/web/helloworld
WORKDIR /srv/web/
RUN /srv/venv/bin/pip install pip setuptools -U && \
    /srv/venv/bin/pip install -r requirements.txt


RUN pip install --upgrade pip
