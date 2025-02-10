FROM argilladev/synt-generator:latest

RUN useradd -ms /bin/bash admin && \
 mkdir -p /usr/src/app/data && \
 chown -R admin:admin /usr/src/app/data

USER admin

