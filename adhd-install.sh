#!/bin/bash
if [ `whoami` != 'root' ]; then
echo "need to run as root, or with sudo"; exit
fi

if [[ `lsof /var/lib/dpkg/lock 2>/dev/null` == *"COMMAND"* ]]; then
echo "Looks like some other process has locked dpkg"
echo "Wait until the lock is released and try again"
exit
fi

#get version number
ubuntu_version=`lsb_release -a 2>/dev/null | grep release -i | cut -f2`
if [ -z "$ubuntu_version" ]; then ubuntu_version="15.10"; fi

echo "This script will need to associate a user account with all the tools."
echo "Enter the name of a user account you want associated with the install."
echo "If you enter a new account name... It will be created." 
echo -n "Enter account name [adhd]: "
read account
echo

if [ ${#account} == 0 ]; then
account="adhd"
fi

grepout=`grep "^$account:x" /etc/passwd`

if [ ${#grepout} == 0 ]; then
echo 
echo "Script is creating user: $account"
adduser $account
adduser $account sudo
fi

#Cowrie keygen
cd /tmp
echo
echo
echo
echo
echo "####################################"
echo "# Need to generate keys for cowrie #"
echo "####################################"
echo
echo
ssh-keygen -t dsa -b 1024 -f ssh_host_dsa_key

apt-get update

#install git
apt-get -y install git

#general dependencies
apt-get -y install sqlite3 sqlite nmap

cd /
mkdir adhd
cd adhd
mkdir 1-annoyance
mkdir 2-attribution
mkdir 3-absolution
mkdir 4-attack
cd /
ln -s /opt/artillery /adhd/1-annoyance/artillery
ln -s /opt/beartrap /adhd/1-annoyance/beartrap
ln -s /opt/beef /adhd/4-attack/beef
ln -s /opt/cowrie /adhd/1-annoyance/cowrie
ln -s /opt/creepy /adhd/2-attribution/creepy
ln -s /opt/cryptolocked /adhd/1-annoyance/cryptolocked
ln -s /opt/decloak /adhd/2-attribution/decloak
ln -s /opt/defense_by_numbers /adhd/1-annoyance/defense_by_numbers
ln -s /opt/denyhosts /adhd/1-annoyance/denyhosts
ln -s /opt/docz.py /adhd/2-attribution/docz.py
ln -s /opt/gcat /adhd/4-attack/gcat
ln -s /opt/ghostwriting /adhd/4-attack/ghostwriting
ln -s /opt/honeybadger /adhd/2-attribution/honeybadger
ln -s /opt/human.py /adhd/3-absolution/human.py
ln -s /opt/invisiport /adhd/1-annoyance/invisiport
ln -s /opt/jar-combiner /adhd/2-attribution/jar-combiner
ln -s /opt/java-web-attack /adhd/4-attack/java-web-attack
ln -s /opt/kippo /adhd/1-annoyance/kippo
ln -s /opt/lockdown /adhd/3-absolution/lockdown
ln -s /opt/TALOS /adhd/3-absolution/TALOS
ln -s /opt/nova /adhd/1-annoyance/nova
ln -s /opt/OpenBAC /adhd/3-absolution/OpenBAC
ln -s /opt/oschameleon /adhd/1-annoyance/oschameleon
ln -s /opt/PHP-HTTP-Tarpit /adhd/1-annoyance/PHP-HTTP-Tarpit
ln -s /opt/portspoof /adhd/1-annoyance/portspoof
ln -s /opt/psad /adhd/1-annoyance/psad
ln -s /opt/recon-ng /adhd/4-attack/recon-ng
ln -s /opt/remux /adhd/1-annoyance/remux
ln -s /opt/rubberglue /adhd/1-annoyance/rubberglue
ln -s /opt/sent.py /adhd/3-absolution/sent.py
ln -s /opt/sidejack /adhd/4-attack/sidejack
ln -s /opt/simple-pivot-detect /adhd/3-absolution/simple-pivot-detect
ln -s /opt/sqlitebugserver /adhd/2-attribution/sqlitebugserver
ln -s /opt/spidertrap /adhd/1-annoyance/spidertrap
ln -s /opt/sweeper /adhd/3-absolution/sweeper
ln -s /opt/tcprooter /adhd/1-annoyance/tcprooter
ln -s /opt/webbugserver /adhd/2-attribution/webbugserver
ln -s /opt/weblabyrinth /adhd/1-annoyance/weblabyrinth
ln -s /opt/whosthere /adhd/2-attribution/whosthere
ln -s /opt/windows-tools /adhd/1-annoyance/windows-tools
ln -s /opt/wordpot /adhd/1-annoyance/wordpot
ln -s /opt/opencanary /adhd/3-absolution/opencanary

apt-get -y install python-dev pip
pip install --upgrade pip
easy_install -U pip

if [ $ubuntu_version == "16.04" ]; then
apt-get -y install libapache2-mod-php
apt-get -y install php7.0-mysql
apt-get -y install php7.0-pgsql
apt-get -y install php7.0-sqlite
apt-get -y install php7.0-odbc
fi

if [ $ubuntu_version == "15.10" ]; then
apt-get -y install php5
apt-get -y install php5-mysql
apt-get -y install php5-pgsql
apt-get -y install php5-sqlite
apt-get -y install php5-odbc
fi

echo "127.0.0.1     spy.decloak.net" >> /etc/hosts

#dependencies for metasploit
apt-get -y install libpq-dev libpcap-dev

#dependencies for cowrie
apt-get -y install libmpfr-dev virtualenv libssl-dev libffi-dev build-essential libpython-dev
apt-get -y install libmpc-dev
pip install twisted[conch] cryptography configparser pyopenssl gmpy2 service_identity pycrypto
apt-get -y install git python-twisted python-configparser python-crypto python-pyasn1 python-gmpy2 python-mysqldb python-zope.interface

#dependencies for oschaemeleon
apt-get -y install python-nfqueue python-gevent python-scapy

#dependencies for whosthere
apt-get -y install golang

#dependencies for creepy
apt-get -y install python-qt4 python-pip
pip install pytz python-qt flickrapi python-instagram yapsy tweepy google-api-python-client python-dateutil configobj dominate

#dependencies for TALOS
pip install netaddr
pip install twisted
pip install paramiko

#dependencies for lockdown
pip install splinter

#dependencies for whosthere
apt-get -y install golang-go

#dependencies for wordpot
pip install flask

#dependencies for honeyports
apt-get -y install arpspoof

#beartrap
apt-get -y install ruby
gem install getopt

#beef
gem install bundler
apt-get -y install ruby-dev libsqlite3-dev libsqlite-dev

#decloak
apt-get -y install haxe
if [ $ubuntu_version == "15.10" ]; then
apt-get -y install openjdk-7-jdk
fi
if [ $ubuntu_version == "16.04" ]; then
apt-get -y install openjdk-8-jdk libdbd-pg-perl
fi

#database mysql
debconf-set-selections <<< 'mysql-server mysql-server/root_password password adhd'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password adhd'
apt-get -y install mysql-server
echo "create database weblabyrinth;" | mysql -u root --password=adhd
echo "create database webbug;" | mysql -u root --password=adhd
echo "create user 'webbuguser'@'localhost' identified by 'adhd';" | mysql -u root --password=adhd
echo "create user 'weblabyrinthuser'@'localhost' identified by 'adhd';" | mysql -u root --password=adhd
echo "grant all privileges on weblabyrinth.* to 'weblabyrinthuser'@'localhost';" | mysql -u root --password=adhd
echo "grant all privileges on webbug.* to 'webbuguser'@'localhost';" | mysql -u root --password=adhd
echo "create table weblabyrinth.crawlers (crawler_ip TEXT, crawler_rdns TEXT, crawler_useragent TEXT, first_seen INT(11), last_seen INT(11), last_alert INT(11), num_hits INT(11));" | mysql -u root --password=adhd
echo "create table webbug.requests (id TEXT, type TEXT, ip_address TEXT, user_agent TEXT, time INT(11));" | mysql -u root --password=adhd

#database postgres SOON
apt-get -y install postgresql postgresql-contrib

sudo -u postgres psql -c "CREATE USER decloakuser WITH PASSWORD 'adhd';"

sudo -u postgres psql << EOF
CREATE DATABASE decloak;
\\connect decloak
--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: requests; Type: TABLE; Schema: public; Owner: decloakuser; Tablespace: 
--

CREATE TABLE requests (
    cip character(32),
    type character varying(16),
    eip character varying(16),
    iip character varying(16),
    dip character varying(16),
    stamp timestamp without time zone DEFAULT now()
);


ALTER TABLE public.requests OWNER TO decloakuser;

--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: decloakuser
--

COPY requests (cip, type, eip, iip, dip, stamp) FROM stdin;
\.


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--
EOF

cd /etc/postgresql/*/main/
sed -i '/local   all             all                                     peer/c\local   all             all                                     md5\' pg_hba.conf
cd -
service postgresql restart


if ! grep -q 'neoadhd' /etc/apt/sources.list; then
	echo "deb  http://anonymoustaunts.com/neoadhd ./" >> /etc/apt/sources.list
fi
apt-get update
apt-get -y --force-yes install adhd-*

#post install beef
cd /opt/beef
bundle update

#post install opencanary
cd /opt/opencanary
pip install -r requirements.txt
python ./setup.py install
opencanaryd --copyconfig

#post install artillery
cp -R /opt/artillery /var/artillery

#post install psad
apt-get -y install cpanminus
cpanm Date::Calc

#post install recon-ng
cd /opt/recon-ng
apt-get -y install libxml2-dev libxslt1-dev
pip install -r REQUIREMENTS

#post install labyrinth
#a2enmod rewrite

#post install cowrie
cd /opt/cowrie/data
mv -f /tmp/ssh_host_dsa_key ./
cd /opt/cowrie
pip install -r requirements.txt

#post install www
#chown www-data:www-data /var/www -R

#post kippo
apt-get -y install python-twisted
pip install -I twisted==9.0.0

#Install portspoof
cd /opt/portspoof
./configure
make
make install

#post install
git clone https://github.com/trustedsec/social-engineer-toolkit /opt/set
cd /opt/set
pip install -r requirements.txt
./setoolkit & sleep 5 && killall python
cd /etc/setoolkit
sed -i '/METASPLOIT_PATH/c\METASPLOIT_PATH=/opt/metasploit\' ./set.config
cd -
git clone https://github.com/rapid7/metasploit-framework /opt/metasploit
cd /opt/metasploit
bundle install

git clone https://github.com/adhdproject/webkit /var/www
apt-get -y install apache2 
chown www-data:www-data -R /var/www
chown $account:$account -R /opt
a2enmod rewrite #for labyrinth
a2enmod php7.0
a2dismod mpm_event
a2enmod mpm_prefork
echo "<VirtualHost *:80>
        ServerAdmin webmaster@localhost
        DocumentRoot /var/www

	DirectoryIndex index.php
	

        <Directory /var/www>
                Options -Indexes +FollowSymLinks -MultiViews
		AllowOverride all
		Order allow,deny
		Allow from all
        	
	</Directory>

	<Directory /var/www/windows_tools>
		Options +Indexes
	</Directory>

	<Directory /var/www/honeybadger>
		RedirectMatch 404 /(\\.git|include|data|admin)
	</Directory>

        ErrorLog \${APACHE_LOG_DIR}/error.log
        CustomLog \${APACHE_LOG_DIR}/access.log combined

</VirtualHost>" > /etc/apache2/sites-available/000-default.conf
service apache2 restart
touch .traditional-ran
reset
