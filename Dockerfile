FROM selenium/standalone-chrome-debug:3.141.59

USER root

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      software-properties-common \
      libssl-dev \
      openssl \
  && \
  python --version && \
  python3 --version && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      python-pip \
      python3-pip \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN \
  pip install --no-cache-dir python-xlib && \
  pip3 install --no-cache-dir \
    inotify_simple \
    python3-xlib \
  && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      ffmpeg \
      python3-tk \
      python3-dev \
      scrot \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
RUN \
  touch \
    /root/.Xauthority \
    /home/seluser/.Xauthority \
  && \
  XAUTHORITY=/root/.Xauthority \
    pip3 install --no-cache-dir \
      pyautogui

