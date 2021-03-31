#!/bin/bash
# chmod 700 api-restart.sh

if [[ "$1" == "master" ]]; then
	npm install --prefix /srv/nodejs/senti/services/dataseries/production
	systemctl restart senti-dataseries.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Senti Dataseries MASTER updated and restarted!"}' $2
	echo
	exit 0
fi

if [[ "$1" == "dev" ]]; then
	npm install --prefix /srv/nodejs/senti/services/dataseries/development
	systemctl restart senti-dataseries-dev.service
	# Senti Slack Workspace
	curl -X POST -H 'Content-type: application/json' --data '{"text":"Senti Dataseries DEV updated and restarted!"}' $2
	echo
	exit 0
fi

exit 0
