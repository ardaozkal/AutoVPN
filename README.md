# AutoVPN
Automatic VPN account creation and mailing system

## How to use

[Install an OpenVPN on your server using these stuff](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04), edit stuff as you wish.

Create a mailgun account, get your api key.

Edit the `easyvpn.sh`, with your domain, message content and api key. Copy that to `~/openvpn-ca` folder of your server.

To generate and send an openvpn config, run `./easyvpn.sh certname clientsmail@example.tld` while on `~/openvpn-ca`.

## Example Result

![Example Result](https://i.imgur.com/U57VY7K.png)
