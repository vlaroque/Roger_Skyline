# Roger Skyline

.\VBoxManage.exe modifyhd 'C:\Users\user\VirtualBox VMs\deby\deby.vdi' --resizebyte 8000000000

## ==> Configuration de la VM

Pour la taille du disque dur choisir 7.45 Gio qui équivalent à 8 Go du sujet

Mot de passe root : root123

Dans la configuration de debian les unités sont des GB et pas des Gib donc sont identiques en octets

Avec df on peut utiliser -B** en remplaçant * par GB pour des GIgabites et G pour des Gibibytes

Utiliser `fdisk –l` pour voir 3,9 Gib donc équivalent a 4,2 GB en taille conventionnelle, sinon calculer avec la taille des blocks.

<br>

## ==> Réseau et sécurité

### Utilisateur non root

user : user42
mdp : user123

<br>

### Configuration de sudo

Installer sudo et donner le droit de l’utiliser a user :

```sh
apt install sudo
adduser user sudo
```

<br>

### > Adresse ip statique

```sh
ip a #pour trouver son ip et broadcast
ip route # pour trouver le gateway apres via
```

### > Configuration de ssh

Installation du serveur ssh

```sh
apt install openssh-server
```

Les fichiers de configuration se trouvent dans le dossier /etc/ssh.

Deux fichiers de configuration y figurent :

* `ssh_config` pour le client
* `sshd_config` pour le server.

Pour changer le port on decommente la ligne `Port` et on modifie le numéro derrière par 2222 par exemple.
Désactiver l'utilisation du compte root `PermitRootLogin no`

Relancer le serveur ssh :

```sh
service ssh restart
```

<br>

### > Firewall

Installation de UFW:

```sh
sudo apt install ufw
```

Configuration:

```bash
sudo ufw allow 80 #http
sudo ufw allow 443 #https
sudo ufw limit 2222 #SSH limit 6 or more connections
```

Activer UFW

```bash
sudo ufw enable
```

Vérifier l'état de protection:

```bash
sudo ufw status
```

<br>

### > DDOS Protection

Installation de fail2ban

```sh
sudo apt install fail2ban #installation
cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local #creation du fichier de configuration
```

https://www.supinfo.com/articles/single/2660-proteger-votre-vps-apache-avec-fail2ban pour la regle du ddos sur http https

dans le fichier `jail.local` ajouter

```conf
[apache-dos]
enabled = true
port = http,https
filter = apache-dos
logpath = /var/log/apache2/access.log
bantime = 600
maxretry = 300
findtime = 300
ignoreip = 192.168.1.43 #<---Votre IP pour ne pas vous bannir
action = iptables[name=HTTP, port=http, protocol=tcp]
```

ajouter un fichier filtre dans le dossier `filters.d/apache-dos.conf`

```conf
[Definition]
failregex = ^<HOST> -.*"(GET|POST).*
ignoreregex =
```

Tester :

Sur la machine attaquante lancer :

```sh
python3 slowloris.py -v 192.168.1.254 #installation
```

Au bout de 600 tentatives : connection refused
Sur la machine deby :

```sh
sudo fail2ban-client status #pour voir si une ip a été bannie
sudo fail2ban-client status apache-dos #pour voir l'ip bannie
sudo fail2ban-client unban --all #pour unban toutes les ip
```

https://github.com/gkbrk/slowloris pour le dos

### > Protection contre le scan de ports

https://www.geeek.org/portsentry-linux-securite/

```sh
sudo apt install portsentry #installation de portcdsentry

```

Les adresses bloquées peuvent être retrouvées dans le fichier /var/lib/portsentry/portsentry.history

```sh
sudo route -n # pour voir toutes les connections bloquees
sudo ip r

```

```sh
sudo ip r del 192.168.1.252/30 # unban l'ip
```

enlever aussi l'entrée dans /etc/hosts.deny

lancer un test abec nmap + ip

### > Arreter les services inutiles

```sh
service --status-all #show all services that are running
```

services inutiles: apparmor
dbus utile pour les ouvertures de sessions

sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=IDF/O=42/OU=Project-roger/CN=10.11.200.247" -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/apache-selfsigned.key -out /etc/ssl/certs/apache-selfsigned.crt