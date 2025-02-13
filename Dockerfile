FROM argilladev/synt-generator:latest

ENV DATA_DIR=/data

RUN useradd -ms /bin/bash admin \
 && chown -R admin:admin /data \
 && chmod -R 777 /data

USER admin

ENV INFERENCE_PROVIDER=sambanova
