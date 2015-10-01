FROM debian:stable

RUN \
  apt-get update && \
  apt-get install -y --no-install-recommends \
  supervisor \
  ca-certificates \
  build-essential \
  git && \
  rm -rf /var/lib/apt/lists/*

RUN \
  cd /opt && \
  git clone https://github.com/antirez/disque.git && \
  cd disque && \
  make all

RUN \
	apt-get purge -y \
		build-essential \
		git && \
	rm -rf /var/lib/apt/lists/*
		
ENV PATH /opt/disque/src:$PATH


COPY scripts/supervisord.conf /etc/supervisor/supervisord.conf
COPY scripts/supervisor-disque.conf /etc/supervisor/conf.d/disque.conf

EXPOSE 7711 9001
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]
