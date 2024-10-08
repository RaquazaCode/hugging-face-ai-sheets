#!/usr/bin/env bash

set -e

# Preset oauth env vars based on injected space variables.
# See https://huggingface.co/docs/hub/en/spaces-oauth#create-an-oauth-app
export OAUTH2_HUGGINGFACE_CLIENT_ID=$OAUTH_CLIENT_ID
export OAUTH2_HUGGINGFACE_CLIENT_SECRET=$OAUTH_CLIENT_SECRET
export OAUTH2_HUGGINGFACE_SCOPE=$OAUTH_SCOPES

# Set the space creator name as username if no name is provided, if the user is not found, use the provided space author name
# See https://huggingface.co/docs/hub/en/spaces-overview#helper-environment-variables for more details
DEFAULT_USERNAME=$(curl -L -s https://huggingface.co/api/users/${SPACES_CREATOR_USER_ID}/overview | jq -r '.user' || echo "${SPACE_AUTHOR_NAME}")
export USERNAME="${USERNAME:-$DEFAULT_USERNAME}"

DEFAULT_PASSWORD=$(pwgen -s 16 1)
export PASSWORD="${PASSWORD:-$DEFAULT_PASSWORD}"

if [ ! -d /data/argilla/backup ]; then
  mkdir -p /data/argilla/backup
fi

# if exists the db file, copy it to the backup folder and rename it
if [ -f /data/argilla/argilla.db ]; then
  cp /data/argilla/argilla.db /data/argilla/backup || true
  mv /data/argilla/argilla.db /data/argilla/argilla.db.bak || true
fi

# if exists the server id file, copy it to the argilla folder
if [ -f /data/argilla/server_id.dat ]; then
  cp /data/argilla/server_id.dat /data/argilla/backup || true
fi

# Copy the backup files to the argilla folder
cp -r /data/argilla/backup/* $ARGILLA_HOME_PATH || true

honcho start
