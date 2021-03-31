#!/bin/bash

if [[ "$1" == "master" ]]; then
	echo
	echo Deploying Senti Data Broker $1 ...
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/services/dataseries/production
	echo
	echo Restarting Senti Data Broker service: $1 ...
	ssh deploy@rey.webhouse.net "sudo /srv/nodejs/senti/services/dataseries/production/scripts/service-restart.sh master $3"
	echo
	echo Deployment to Senti Data Broker $1 and restart done!
	exit 0
fi

if [[ "$1" == "dev" ]]; then
	echo
	echo Deploying Senti Data Broker $1 ...
	rsync -r --quiet $2/ deploy@rey.webhouse.net:/srv/nodejs/senti/services/dataseries/development
	echo
	echo Restarting Senti Data Broker service: $1 ...
	ssh deploy@rey.webhouse.net "sudo /srv/nodejs/senti/services/dataseries/development/scripts/service-restart.sh dev $3"
	echo
	echo Deployment to Senti Data Broker $1 and restart done!
	exit 0
fi