#!/bin/bash
if [ `whoami` != 'root' ]; then
echo "need to run as root, or with sudo"; exit
fi

apt-get update

#install git
apt-get -y install git


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


apt-get -y install python-dev
apt-get -y install php5
apt-get -y install php5-mysql
apt-get -y install php5-pgsql
apt-get -y install php5-sqlite
apt-get -y install odbc

echo "127.0.0.1     spy.decloak.net" >> /etc/hosts

#dependencies for oschaemeleon
apt-get -y install python-nfqueue python-gevent

#dependencies for whosthere
apt-get -y install golang

#dependencies for creepy
apt-get -y install python-qt4 python-pip
pip install pytz python-qt flickrapi python-instagram yapsy tweepy google-api-python-client python-dateutil configobj dominate

#dependencies for lockdown
pip install splinter

#dependencies for sent.py
pip install nltk

#dependencies for whosthere
apt-get -y install golang-go

#dependencies for wordpot
pip install flask

#beartrap
apt-get -y install ruby
gem install getopt

#beef
gem install bundler
apt-get -y install ruby-dev libsqlite3-dev libsqlite-dev

#decloak
apt-get -y install openjdk-7-jdk

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


if ! grep -q 'neoadhd' /etc/apt/sources.list; then
	echo "deb  https://github.com/adhdproject/neoadhd/raw/master ./" >> /etc/apt/sources.list
fi
apt-get update
apt-get -y --force-yes install adhd-*

#post install beef
cd /opt/beef
bundle install

#post install www
chown www-data:www-data /var/www -R

#post kippo
apt-get -y install python-twisted

#Install portspoof
cd /opt/portspoof
./configure
make
make install

#post install
#chown adhd:adhd /opt -R
git clone https://github.com/trustedsec/social-engineer-toolkit /opt/set
git clone https://github.com/rapid7/metasploit-framework /opt/metasploit
git clone https://github.com/adhdproject/webkit /var/www
apt-get -y install apache2 
chown www-data:www-data -R /var/www

