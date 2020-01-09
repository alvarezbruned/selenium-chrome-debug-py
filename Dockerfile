FROM selenium/standalone-chrome-debug:3.14.0

USER root

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      software-properties-common \
      libssl-dev \
      openssl \
  && \
  add-apt-repository -y ppa:deadsnakes/ppa && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      python3.6 \
  && \
  update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2 && \
  update-alternatives --set python3 /usr/bin/python3.6 && \
  update-alternatives --remove python3 /usr/bin/python3.5 && \
  python --version && \
  python3 --version && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      python-pip \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  curl --fail --location --show-error --silent https://bootstrap.pypa.io/get-pip.py | sudo -H python3.6
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
  chown -v seluser:seluser /home/seluser/.Xauthority \
  && \
  XAUTHORITY=/home/seluser/.Xauthority \
    pip3 install --no-cache-dir \
      pyautogui

USER seluser
