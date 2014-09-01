# not a bash script, but steps for setup
sudo su -
cd /etc/postfix
echo “[smtp.mandrillapp.com] {USERNAME}:{API_KEY}” >> sasl_passwd
chmod 600 sasl_passwd 
postmap sasl_passwd
vim main.cf
# enable SASL authentication
smtp_sasl_auth_enable = yes
# tell Postfix where the credentials are stored
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd 
smtp_sasl_security_options = noanonymous
# use STARTTLS for encryption
smtp_use_tls = yes 
relayhost = [smtp.mandrillapp.com]
service postfix restart
