Rôle ssmtp pour ansible
=======================

Utilise un SMTP extérieur pour envoyer les mails des serveurs.

Variables :
 - ssmtp_username : identifiant pour le compte SMTP
 - ssmtp_password : Mot de passe pour le compte SMTP
 - ssmtp_host : adresse du serveur SMTP
 - ssmtp_port (défaut : 587) : port du serveur SMTP
 - ssmtp_use_tls (défaut : YES) : cf UseTLS dans man ssmtp.conf
 - ssmtp_use_start_tls (défaut : NO) : cf UseSTARTTLS dans man ssmtp.conf
 - ssmtp_from_line_override : (défaut : YES) : cf. FromLineOverride dans man ssmtp.conf
 - ssmtp_rewrite_domain (défaut : ansible_domain) : cf. FromLineOverride dans man ssmtp.conf

 Utilise les variables ansible suivantes :
  - ansible_domain
  - inventory_hostname_short
  - inventory_hostname
