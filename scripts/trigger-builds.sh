#!/bin/bash

BODY='{
"request": {
  "message":"Build triggered by Jenkins build on ci.inria.fr",
  "branch":"master"
}}'

curl -m 5 -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token LOvjbefQWMRVTnyibGNl4A" \
  -d "${BODY}" \
  https://api.travis-ci.org/repo/theseion%2FFuel/requests

BODY='{
  "accountName": "theseion",
  "projectSlug": "fuel"
}'

curl -m 5 -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Authorization: Bearer 7vsywh57m1iaibnb28r1" \
  -d "${BODY}" \
  https://ci.appveyor.com/api/builds

exit 0
