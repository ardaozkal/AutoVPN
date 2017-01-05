#!/bin/bash

client=$1
mail=$2
vpnname='SomeVPN'
mailgunapikey='api:insert_mailgun_apikey_here' #has to start with api:
mailgundomainname='example.com'
mailgunfrom='SomeVPN Invitation <somemail@yourdomain.com>' #has to contain the actual mail in brackets
mailgunsubject='You are invited to SomeVPN'
mailguncontents='Hello there!\nYou are invited to trying SomeVPN!\nYou can view installation steps on https://blog.ardao.me/connecting-to-ardavpn\n\nMerhabalar, SomeVPNi denemeye davetlisiniz!\nKurmak icin adimlari https://blog.ardao.me/ardavpne-baglanmak adresinde bulabilirsiniz.'

. vars
./pkitool $client
../client-configs/make_config.sh $client
curl -s --user $mailgunapikey https://api.mailgun.net/v3/$mailgundomainname/messages -F from=$mailgunfrom -F to=$mail -F subject=$mailgunsubject-F text=$mailguncontents -F attachment=@../client-configs/files/$client.ovpn
