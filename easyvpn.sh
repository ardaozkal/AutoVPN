#!/bin/bash

client=$1
mail=$2
vpnname='SomeVPN'
mailgun_apikey='api:key-yourapikeyhere' #has to start with api:key-
mailgun_domainname='mg.example.com'
mailgun_from="$vpnname Registration <$vpnname@$mailgun_domainname>" #has to contain the actual mail in brackets
mailgun_subject="You are invited to $vpnname"
mailgun_textcontents="Hello there! You are invited to try out $vpnname! You can view installation steps on https://blog.ardao.me/connecting-to-ardavpn -- Merhabalar, $vpnname i denemeye davetlisiniz! Kurmak icin adimlari https://blog.ardao.me/ardavpne-baglanmak adresinde bulabilirsiniz."
mailgun_htmlfilename="mailcontents.html"
mailgun_replyto='vpnsupport@example.com' #Put your personal mail or support mail here.

#don't touch anything below if you don't know what you are doing
if [ -f $mailgun_htmlfilename ];
then
    sed -i -e "s/VPNNAME/$vpnname/g" $mailgun_htmlfilename
    sed -i -e "s/REPLYTO/$mailgun_replyto/g" $mailgun_htmlfilename
    mailgun_htmlcontents=`cat "$mailgun_htmlfilename"`
    . vars
    ./pkitool $client
    ../client-configs/make_config.sh $client
    curl -s --user "$mailgun_apikey" https://api.mailgun.net/v3/$mailgun_domainname/messages -F from="$mailgun_from" -F to="$mail" -F subject="$mailgun_subject" -F text="$mailgun_contents" --form-string html="$mailgun_htmlcontents" -F h:Reply-To="$mailgun_replyto" -F attachment=@../client-configs/files/$client.ovpn
    echo "" #mailgun takes a line ugh
    echo "Completed and sent to $mail."
else
    echo "HTML file doesn't exist. Downloading and making one now."
    wget "https://raw.githubusercontent.com/ardaozkal/AutoVPN/master/mailcontents.html" --output-document=$mailgun_htmlfilename
    sed -i -e "s/VPNNAME/$vpnname/g" $mailgun_htmlfilename
    sed -i -e "s/REPLYTO/$mailgun_replyto/g" $mailgun_htmlfilename
    echo "Should be done. Re-run script please."
fi
