FROM argilladev/synt-generator:latest

RUN chown -R admin:admin /usr/src/app
RUN chmod 755 /usr/src/app
USER admin

