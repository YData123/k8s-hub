FROM jupyterhub/k8s-hub:0.9.0-beta.2.000.bed779e

USER root
COPY hub/favicon.ico /usr/local/share/jupyterhub/static/favicon.ico
COPY hub/jupyter.png /usr/local/share/jupyterhub/static/images/jupyter.png
COPY hub/jupyterhub-80.png /usr/local/share/jupyterhub/static/images/jupyterhub-80.png

USER ${NB_USER}
