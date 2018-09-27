#!/bin/bash
curl -X PATCH -H "Travis-API-Version: 3"    -H "Content-Type: application/json"    -H "Authorization: token $TRAVIS_TOKEN"  -d '{ "env_var.value": "'$1'", "env_var.public": false }' https://api.travis-ci.org/repo/21182775/env_var/a7ba3e93-21cd-4c78-8cb0-19c3943b526c
