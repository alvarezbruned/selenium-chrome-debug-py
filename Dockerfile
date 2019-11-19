FROM selenium/standalone-chrome-debug:3.14.0

USER root
RUN apt-get update
RUN apt-get install -y software-properties-common libssl-dev openssl
RUN add-apt-repository -y ppa:jonathonf/python-3.6
RUN apt-get update
RUN apt-get install -y python3.6
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2

RUN update-alternatives --set python3 /usr/bin/python3.6
RUN update-alternatives --remove python3 /usr/bin/python3.5
RUN python --version
RUN python3 --version

RUN apt-get install -y python-pip
RUN apt-get install -y python3-pip

RUN apt-get -y install scrot
RUN pip install python-xlib
RUN pip3 install python3-xlib
RUN apt-get install -y python3-tk python3-dev
RUN apt-get install -y ffmpeg

RUN touch /root/.Xauthority
RUN touch /home/seluser/.Xauthority
RUN chown seluser:seluser /home/seluser/.Xauthority
RUN touch /root/.Xauthority
RUN pip install --upgrade pip
RUN pip3 install --upgrade pip
USER seluser
RUN XAUTHORITY=/home/seluser/.Xauthority pip3 install pyautogui --user
RUN pip3 install inotify_simple --user


