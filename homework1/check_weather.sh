#!/bin/bash

REQUIRED_PACKAGES="curl jq"
HAS_BEEN_UPDATED=false

for PACKAGE in $REQUIRED_PACKAGES
do
        if ! which $PACKAGE > /dev/null;
        then
                if ! $HAS_BEEN_UPDATED;
                then
                        apt update
                        HAS_BEEN_UPDATED=true
                fi
		apt install $PACKAGE -y
        fi
done

CITY="${1:-Perm}"

WEATHER=$(curl -s "wttr.in/$CITY?format=j1" | jq '.current_condition[0] | {humidity,temp_C}')

TEMPERATURE=$(echo $WEATHER | jq '.temp_C' | tr -d \")
HUMIDITY=$(echo $WEATHER | jq '.humidity' | tr -d \")

echo "Weather in $CITY: $TEMPERATURE⁰C"
echo "Humidity: $HUMIDITY%"
