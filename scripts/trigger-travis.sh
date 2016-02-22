#!/bin/bash

body='{
"request": {
  "message":"Build triggered by Jenkins build on ci.inria.fr",
  "branch":"master"
}}'

curl -m 5 -s -X POST \
  -H "Content-Type: application/json" \
  -H "Accept: application/json" \
  -H "Travis-API-Version: 3" \
  -H "Authorization: token LOvjbefQWMRVTnyibGNl4A" \
  -d "$body" \
  https://api.travis-ci.org/repo/theseion%2FFuel/requests
