#!/bin/bash

AWS=$(curl -X OPTIONS -f --connect-timeout 2 http://169.254.169.254/latest/ > /dev/null 2>&1; echo $?)
MAX_RETRIES=5

if [[ $AWS == 0 ]]; then
  eval "$(/opt/bin/ec2-env)"
fi

args=$@
ex=1
count=0
while [ $ex -ne 0 ] && [ $count -lt $MAX_RETRIES ]; do
  let count+=1
  /usr/bin/env aws $args
  ex=$?
done

exit $ex
