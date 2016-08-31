#!/bin/bash

BODY='{
"request": {
  "message":"Build triggered by Jenkins build on ci.inria.fr",
  "branch":"master"
}}'

curl -m 5 -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/vnd.travis-ci.2+json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token ${TRAVIS_TOKEN}" \
  -d "${BODY}" \
  https://api.travis-ci.org/repo/theseion%2FFuel/requests

BODY='{
  "accountName": "theseion",
  "projectSlug": "fuel"
}'

curl -m 5 -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer ${APPVEYOR_TOKEN}" \
  -d "${BODY}" \
  https://ci.appveyor.com/api/builds

exit 0
