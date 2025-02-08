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
    libgl1-mesa-glx \
    && rm -rf /var/lib/apt/lists/*

COPY . .

RUN pip install torch==2.2.2 --index-url https://download.pytorch.org/whl/cpu && \
    pip install -r requirements.txt

CMD ["python3", "src/app.py", "-w"]