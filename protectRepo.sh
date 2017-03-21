#!/bin/bash

#point to the repo list
repoList="<PATH_TO_REPOLIST>.txt"

count=0

cat $repoList | while read LINE

do 

let count++

curl -v https://api.github.com/repos/$LINE/branches/master/protection?access_token=<TOKEN> -X PUT -d '{ "required_status_checks": null, "required_pull_request_reviews": { "include_admins": false }, "restrictions": null }' -H "Accept: application/vnd.github.loki-preview"

echo "Amended $LINE \n"

done




