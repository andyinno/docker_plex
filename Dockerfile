FROM resin/rpi-raspbian:jessie
MAINTAINER Andrea Innocenti <andyinno@gmail.com>

RUN sudo apt-get update && \
	apt-get install -y \
		apt-transport-https \
		ca-certificates \
		locales \ 
		wget && \
	wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key  | sudo apt-key add - && \
	echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list && \
	apt-get update && \
	apt-get install -t jessie plexmediaserver -y

VOLUME ["/config", "/data"]
ENV HOME=/config
EXPOSE 32400
#WORKDIR ${PLEX_PATH}
COPY start.sh /start.sh
CMD ["bash", "/start.sh"]
