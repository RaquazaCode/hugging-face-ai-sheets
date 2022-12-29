---
title: Template Argilla Space Docker
emoji: 📊
colorFrom: gray
colorTo: yellow
sdk: docker
pinned: false
app_port: 6900
fullWidth: true
---

Use this Space to launch your Argilla app. This space can be configured with two secret env variables (you can find how to this under Settings in your Space page):

- `API_KEY`: You can set up your own API key for uploading and reading data with Argilla Python client. This API_KEY can be any string you want.
- `PASSWORD`: You can set up the password for login into the UI, in case you want to disable access to other users. The default username is `argilla`. If you don't set up this secret the password will be `1234`


