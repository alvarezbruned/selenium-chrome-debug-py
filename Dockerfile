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
  add-apt-repository -y ppa:jonathonf/python-3.6 && \
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
      python3-pip \
      install scrot \
  && \
  pip install --no-cache-dir python-xlib && \
  pip3 install --no-cache-dir python3-xlib \
  && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      python3-tk \
      python3-dev \
      ffmpeg \
  && \
  touch \
    /root/.Xauthority \
    /home/seluser/.Xauthority \
  && \
  chown -v seluser:seluser /home/seluser/.Xauthority && \
  pip install --no-cache-dir --upgrade pip && \
  pip3 install --no-cache-dir --upgrade pip \
  && \
  XAUTHORITY=/home/seluser/.Xauthority \
    pip3 install --no-cache-dir \
      pyautogui \
      inotify_simple \
  && \
  apt-get clean && \
  rm -rfv /var/lib/apt/lists/*

USER seluser
