FROM python:3.12

WORKDIR /fastsdcpu

RUN apt-get update && apt-get install -y \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    libjpeg-dev \
    zlib1g-dev \
    libtiff5-dev \
    liblcms2-dev \
    libwebp-dev \
    tcl8.6-dev \
    tk8.6-dev \
    python3-tk \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN chmod +x install.sh start.sh start-webui.sh

RUN ./install.sh

CMD ["./start-webui.sh"]