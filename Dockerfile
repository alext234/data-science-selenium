FROM jupyter/datascience-notebook

ENV CHROME_VER=79.0.3945.36
ENV FIREFOX_VER=v0.26.0


USER root

# Chrome and Firefox browsers
RUN apt-get update && \
	apt-get install -y gnupg && \
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - && \
	sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && apt-get install -y google-chrome-stable firefox vim


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
RUN python -m space download en_core_web_sm
RUN python -m nltk.downloader all

EXPOSE 8888
