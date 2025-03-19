FROM huggingfacedg/dataground-dev:main

RUN useradd -ms /bin/bash admin \
 && chown -R admin:admin /usr/src/app \
 && chmod -R 777 /usr/src/app

USER admin

ENV OAUTH_CLIENT_ID=''
