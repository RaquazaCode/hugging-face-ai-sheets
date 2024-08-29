# Related PR https://github.com/argilla-io/argilla/pull/5279
FROM argilladev/argilla-hf-spaces:pr-5279

# Copy the auth config section
COPY .oauth.yaml /home/argilla/

# Uncoment this line to remove the persistence storage warning
#ENV ARGILLA_SHOW_HUGGINGFACE_SPACE_PERSISTENT_STORAGE_WARNING=false


# ----------------------------------------------------------------------
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