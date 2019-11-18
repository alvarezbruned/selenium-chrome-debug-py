FROM selenium/standalone-chrome-debug:3.14.0

USER root
RUN apt-get update \
  apt-get install -y software-properties-common libssl-dev openssl \
  add-apt-repository -y ppa:jonathonf/python-3.6 \
  apt-get update \
  apt-get install -y python3.6 \
  update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2 \
  update-alternatives --set python3 /usr/bin/python3.6 \
  update-alternatives --remove python3 /usr/bin/python3.5 \
  python --version \
  python3 --version \
  apt-get install -y python-pip \
  apt-get install -y python3-pip \
  apt-get -y install scrot \
  pip install python-xlib \
  pip3 install python3-xlib \
  apt-get install -y python3-tk python3-dev \
  apt-get install -y ffmpeg \
  pip install --upgrade pip \
  pip3 install --upgrade pip \
  --no-install-recommends \
  && rm -rf /var/lib/apt/lists/*
RUN touch /root/.Xauthority \
  touch /home/seluser/.Xauthority \
  chown seluser:seluser /home/seluser/.Xauthority \
  touch /root/.Xauthority
USER seluser
RUN XAUTHORITY=/home/seluser/.Xauthority pip3 install pyautogui --user
RUN pip3 install inotify_simple --user

