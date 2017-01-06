# AutoVPN
Automatic VPN account creation and mailing system

## How to use

[Install an OpenVPN on your server using these stuff](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-openvpn-server-on-ubuntu-16-04), edit stuff as you wish.

Create a mailgun account, get your api key.

Download the `easyvpn.sh` file to the server and edit the variables on top of it.

To generate and send an openvpn config, run `./easyvpn.sh certname clientsmail@example.tld`.

## Example Result

![Example Result](https://i.imgur.com/1oa4yR6.png)
