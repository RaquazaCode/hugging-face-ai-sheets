FROM argilla/argilla-quickstart:v1.11.0


# Define datasets to preload: full=all datasets, single=one dataset, and none=no datasets.
ENV LOAD_DATASETS=single

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

CMD /start_quickstart_argilla.sh
