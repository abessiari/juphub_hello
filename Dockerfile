FROM jupyterhub/singleuser:2.3.0

COPY --chown=${NB_UID}:${NB_GID} . .
