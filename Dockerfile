FROM argilladev/argilla-hf-spaces:pr-5313
#FROM argilla/argilla-quickstart:releases-v1.29.1


# Copy the auth config section
COPY .oauth.yaml /home/argilla/

#COPY log_config.yaml /home/argilla/

#ENV UVICORN_WORKERS=5
ENV UVICORN_LOOP=uvloop
ENV UVICORN_HTTP=httptools
ENV UVICORN_LIFESPAN=on
ENV UVICORN_BACKLOG=1024
ENV UVICORN_LIMIT_CONCURRENCY=2048
#ENV UVICORN_TIMEOUT_KEEP_ALIVE=1
#ENV UVICORN_TIMEOUT_GRACEFUL_SHUTDOWN=5
#ENV UVICORN_LOG_CONFIG=/home/argilla/log_config.yaml


# old
#FROM argilla/argilla-quickstart:v1.29.0

# Copy the auth config section
#COPY .oauth.yaml /home/argilla/

#ENV OAUTH_ID=""
# Uncomment the next section to keep backward compatibility with previous versions
## Following variables are used for backward compatibility with the previous security setup for the quickstart image
#ENV ADMIN_USERNAME="team"
#ENV ADMIN_API_KEY="team.apikey"
## The password has a minimum length of 8. Passwords with lower lengths will fail.
#ENV ADMIN_PASSWORD=12345678
#
#ENV ANNOTATOR_USERNAME="argilla"
## The password has a minimum length of 8. Passwords with lower lengths will fail.
#ENV ANNOTATOR_PASSWORD=12345678
#
#ENV ARGILLA_WORKSPACE="team"
#

# Uncomment the next line if a new version of Argilla requires a dataset search reindex.
# ENV REINDEX_DATASETS=true

# (since: v1.28.0) Uncomment the next line to force not showing warning message about Hugging Face Space persistent storage not enabled.
# ENV ARGILLA_SHOW_HUGGINGFACE_SPACE_PERSISTENT_STORAGE_WARNING=false