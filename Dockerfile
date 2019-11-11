FROM selenium/standalone-chrome-debug:3.141

USER root
RUN apt-get update
RUN apt-get install -y python-pip
RUN apt-get install -y python3-pip
RUN python -m pip install --trusted-host pypi.python.org --trusted-host files.pythonhosted.org --trusted-host pypi.org --upgrade pip

RUN apt-get -y install scrot
RUN pip install python-xlib
RUN pip3 install python3-xlib
RUN apt-get install -y python3-tk python3-dev
RUN apt-get install -y python-pyaudio
RUN apt-get install -y libpulse-dev
RUN apt-get install -y python-pyaudio python3-pyaudio
RUN apt-get install -y python python-dev python-pip build-essential swig git libpulse-dev
RUN apt-get -y install libasound2-dev
RUN apt-get install -y ffmpeg

RUN touch /root/.Xauthority
RUN touch /home/seluser/.Xauthority
RUN chown seluser:seluser /home/seluser/.Xauthority
RUN touch /root/.Xauthority

USER seluser
RUN XAUTHORITY=/home/seluser/.Xauthority pip3 install pyautogui
RUN pip install speechrecognition --user

RUN pip3 install requests --user

RUN pip3 install pocketsphinx --user
RUN pip3 install requests --user
