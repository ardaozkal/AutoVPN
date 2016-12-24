#!/bin/bash

client=$1
mail=$2

. vars
./pkitool $client
../client-configs/make_config.sh $client
curl -s --user 'api:PUTYOURMAILGUNAPIKEYHERE' https://api.mailgun.net/v3/PUTYOURDOMAINHER/messages -F from='ArdaVPN Registration <ardavpn@mg.ardao.me>' -F to=$mail -F subject='ArdaVPN Invitation' -F text='Hello there! You are invited to try ArdaVPN! You can view installation steps on https://blog.ardao.me/connecting-to-ardavpn/ ( https://blog.ardao.me/ardavpne-baglanmak/ for turkish instructions)' -F attachment=@../client-configs/files/$client.ovpn
