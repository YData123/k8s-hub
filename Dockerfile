FROM jupyterhub/k8s-hub:0.8.2

USER root

RUN \
  apt-get update && \
  apt-get remove -y \
    python3-pycurl && \
  apt-get install -y --no-install-recommends \
    libssl-dev \
    libcurl4-openssl-dev \
    python3-wheel && \
  apt-get purge && \
  apt-get clean

RUN \
  PYCURL_SSL_LIBRARY=openssl pip3 install pycurl

COPY hub/favicon.ico /usr/local/share/jupyterhub/static/favicon.ico
COPY hub/jupyter.png /usr/local/share/jupyterhub/static/images/jupyter.png
COPY hub/jupyterhub-80.png /usr/local/share/jupyterhub/static/images/jupyterhub-80.png

USER ${NB_USER}
