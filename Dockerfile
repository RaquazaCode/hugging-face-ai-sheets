FROM argilladev/synt-generator:latest

RUN useradd -ms /bin/bash admin && \
 mkdir -p /usr/src/app/data && \
 chown -R admin:admin /usr/src/app && \
 chmod 755 /usr/src/app

USER admin

