FROM jupyter/datascience-notebook

# these are the driver versions; they should match the browsers versions
ENV CHROME_VER=83.0.4103.39
ENV FIREFOX_VER=v0.26.0

# this is the browser version  - it should match with the driver
ENV CHROME_BROWSER_VER=83.0.4103.97-1

USER root

# Chrome and Firefox browsers
RUN apt-get update && \
	apt-get install -y gnupg && \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && apt-get install -y google-chrome-stable=${CHROME_BROWSER_VER} firefox vim zip


# chrome driver
RUN wget -q https://chromedriver.storage.googleapis.com/${CHROME_VER}/chromedriver_linux64.zip && \
	unzip -o chromedriver_linux64.zip && \
	rm chromedriver_linux64.zip && \
	mv chromedriver /usr/bin

#  firefox gecko driver
RUN wget -qO- https://github.com/mozilla/geckodriver/releases/download/${FIREFOX_VER}/geckodriver-${FIREFOX_VER}-linux64.tar.gz | tar -xvz -C /usr/bin


# pip requirements.txt
COPY requirements.txt /tmp/requirements.txt
RUN python -m pip install -r /tmp/requirements.txt

RUN git config --global user.email "spamcollectorsuperbot@gmail.com"
RUN git config --global user.name "sc"


EXPOSE 8888
