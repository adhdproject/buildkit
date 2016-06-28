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
while true; do
    read -p "Do you want to install Artillery [y/n]: " artillery
    case $artillery in
        [Yy]* ) ln -s /opt/artillery /adhd/1-annoyance/artillery; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Beartrap [y/n]: " beartrap
    case $beartrap in
        [Yy]* ) ln -s /opt/beartrap /adhd/1-annoyance/beartrap; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install BeEF [y/n]: " beef
    case $beef in
        [Yy]* ) ln -s /opt/beef /adhd/4-attack/beef; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Cowrie [y/n]: " cowrie
    case $cowrie in
        [Yy]* ) ln -s /opt/cowrie /adhd/1-annoyance/cowrie; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Creepy [y/n]: " creepy
    case $creepy in
        [Yy]* ) ln -s /opt/creepy /adhd/2-attribution/creepy; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Cryptolocked [y/n]: " cryptolocked
    case $cryptolocked in
        [Yy]* ) ln -s /opt/cryptolocked /adhd/1-annoyance/cryptolocked; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Decload [y/n]: " decloak
    case $decloak in
        [Yy]* ) ln -s /opt/decloak /adhd/2-attribution/decloak; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Defense by Numbers [y/n]: " defensebynumbers
    case $defensebynumbers in
        [Yy]* ) ln -s /opt/defense_by_numbers /adhd/1-annoyance/defense_by_numbers; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Denyhosts [y/n]: " denyhosts
    case $denyhosts in
        [Yy]* ) ln -s /opt/denyhosts /adhd/1-annoyance/denyhosts; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Docz.py [y/n]: " doczpy
    case $doczpy in
        [Yy]: ) ln -s /opt/docz.py /adhd/2-attribution/docz.py; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Gcat [y/n]: " gcat
    case $gcat in
        [Yy]* ) ln -s /opt/gcat /adhd/4-attack/gcat; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Ghostwriting [y/n]: " ghostwriting
    case $ghostwriting in
        [Yy]* ) ln -s /opt/ghostwriting /adhd/4-attack/ghostwriting; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Honeybadger [y/n]: " honeybadger
    case $honeybadger in
        [Yy]* ) ln -s /opt/honeybadger /adhd/2-attribution/honeybadger; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Human.py [y/n]: " humanpy
    case $humanpy in
        [Yy]* ) ln -s /opt/human.py /adhd/3-absolution/human.py; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Invisiport [y/n]: " invisiport
    case $invisiport in
        [Yy]* ) ln -s /opt/invisiport /adhd/1-annoyance/invisiport; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Jar-Combiner [y/n]: " jarcombiner
    case $jarcombiner in
        [Yy]* ) ln -s /opt/jar-combiner /adhd/2-attribution/jar-combiner; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Java-Web-Attack [y/n]: " javawebattack
    case $javawebattack in
        [Yy]* ) ln -s /opt/java-web-attack /adhd/4-attack/java-web-attack; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Kippo [y/n]: " kippo
    case $kippo in
        [Yy]* ) ln -s /opt/kippo /adhd/1-annoyance/kippo; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Lockdown [y/n]: " lockdown
    case $lockdown in
        [Yy]* ) ln -s /opt/lockdown /adhd/3-absolution/lockdown; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install TALOS [y/n]: " talos
    case $talos in
        [Yy]* ) ln -s /opt/TALOS /adhd/3-absolution/TALOS; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Nova [y/n]: " nova
    case $nova in
        [Yy]* ) ln -s /opt/nova /adhd/1-annoyance/nova; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install OpenBAC [y/n]: " openbac
    case $openbac in
        [Yy]* ) ln -s /opt/OpenBAC /adhd/3-absolution/OpenBAC; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Oschameleon [y/n]: " oschameleon
    case $oschameleon in
        [Yy]* ) ln -s /opt/oschameleon /adhd/1-annoyance/oschameleon; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install PHP-HTTP-Tarpit [y/n]: " phphttptarpit
    case $phphttptarpit in
        [Yy]* ) ln -s /opt/PHP-HTTP-Tarpit /adhd/1-annoyance/PHP-HTTP-Tarpit; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Portspoof [y/n]: " portspoof
    case $portspoof in
        [Yy]* ) ln -s /opt/portspoof /adhd/1-annoyance/portspoof; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Psad [y/n]: " psad
    case $psad in
        [Yy]* ) ln -s /opt/psad /adhd/1-annoyance/psad; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Recon-ng [y/n]: " reconng
    case $reconng in
        [Yy]* ) ln -s /opt/recon-ng /adhd/4-attack/recon-ng; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Remux [y/n]: " remux
    case $remux in
        [Yy]* ) ln -s /opt/remux /adhd/1-annoyance/remux; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Rubberglue [y/n]: " rubberglue
    case $rubberglue in
        [Yy]* ) ln -s /opt/rubberglue /adhd/1-annoyance/rubberglue; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Sent.py [y/n]: " sentpy
    case $sentpy in
        [Yy]* ) ln -s /opt/sent.py /adhd/3-absolution/sent.py; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Sidejack [y/n]: " sidejack
    case $sidejack in
        [Yy]* ) ln -s /opt/sidejack /adhd/4-attack/sidejack; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Simple-Pivot-Detect [y/n]: " simplepivotdetect
    case $simplepivotdetect in
        [Yy]* ) ln -s /opt/simple-pivot-detect /adhd/3-absolution/simple-pivot-detect; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install SQLite Bug Server [y/n]: " sqlitebugserver
    case $sqlitebugserver in
        [Yy]* ) ln -s /opt/sqlitebugserver /adhd/2-attribution/sqlitebugserver; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Sweeper [y/n]: " sweeper
    case $sweeper in
        [Yy]* ) ln -s /opt/sweeper /adhd/3-absolution/sweeper; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install TCP Rooter [y/n]: " tcprooter
    case $tcprooter in
        [Yy]* ) ln -s /opt/tcprooter /adhd/1-annoyance/tcprooter; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Web Bug Server [y/n]: " webbugserver
    case $webbugserver in
        [Yy]* ) ln -s /opt/webbugserver /adhd/2-attribution/webbugserver; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Weblabyrinth [y/n]: " weblabyrinth
    case $weblabyrinth in
        [Yy]* ) ln -s /opt/weblabyrinth /adhd/1-annoyance/weblabyrinth; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Who's There [y/n]: " whosthere
    case $whosthere in
        [Yy]* ) ln -s /opt/whosthere /adhd/2-attribution/whosthere; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Windows-Tools [y/n]: " windowstools
    case $windowstools in
        [Yy]* ) ln -s /opt/windows-tools /adhd/1-annoyance/windows-tools; break;;
        * ) break;;
    esac
done
while true; do
    read -p "Do you want to install Wordpot [y/n]: " wordpot
    case $wordpot in
        [Yy]* ) ln -s /opt/wordpot /adhd/1-annoyance/wordpot; break;;
        * ) break;;
    esac
done


apt-get -y install python-dev
apt-get -y install php5
apt-get -y install php5-mysql
apt-get -y install php5-pgsql
apt-get -y install php5-sqlite
apt-get -y install odbc

echo "127.0.0.1     spy.decloak.net" >> /etc/hosts

#dependencies for oschaemeleon
if [[ "$oschaemeleon" = "y" || "$oschaemeleon" = "Y" ]]
then
    apt-get -y install python-nfqueue python-gevent
fi

#dependencies for creepy
if [[ "$creepy" = "y" || "$creepy" = "Y" ]]
then
    apt-get -y install python-qt4 python-pip
    pip install pytz python-qt flickrapi python-instagram yapsy tweepy google-api-python-client python-dateutil configobj dominate
fi

#dependencies for lockdown
if [[ "$lockdown" = "y" || "$lockdown" = "Y" ]]
then
    pip install splinter
fi

#dependencies for sent.py
if [[ "$sentpy" = "y" || "$sentpy" = "Y" ]]
then
    pip install nltk
fi

#dependencies for whosthere
if [[ "$whosthere" = "y" || "$whosthere" = "Y" ]]
then
    apt-get -y install golang-go
    apt-get -y install golang
fi

#dependencies for wordpot
if [[ "$wordpot" = "y" || "$wordpot" = "Y" ]]
then
    pip install flask
fi

#beartrap
if [[ "$beartrap" = "y" || "$beartrap" = "Y" ]]
then
    apt-get -y install ruby
    gem install getopt
fi

#beef
if [[ "$beef" = "y" || "$beef" = "Y" ]]
then
    gem install bundler
    apt-get -y install ruby-dev libsqlite3-dev libsqlite-dev
fi

#decloak
if [[ "$decloak" = "y" || "$beef" = "Y" ]]
then
    apt-get -y install openjdk-7-jdk
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

echo "--
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

" > /tmp/decloak.dump

sudo -u postgres psql < /tmp/decloak.dump

if ! grep -q 'neoadhd' /etc/apt/sources.list; then
	echo "deb  https://github.com/adhdproject/neoadhd/raw/master ./" >> /etc/apt/sources.list
fi
apt-get update
apt-get -y --force-yes install adhd-*

#post install beef
if [[ "$beef" = "y" || "$beef" = "Y" ]]
then
    cd /opt/beef
    bundle install
fi

#post install www
chown www-data:www-data /var/www -R

#post kippo
if [[ "$kippo" = "y" || "$kippo" = "Y" ]]
then
    apt-get -y install python-twisted
fi

#Install portspoof
if [[ "$portspoof" = "y" || "$portspoof" = "Y" ]]
then
    cd /opt/portspoof
    ./configure
    make
    make install
fi

#post install
#chown adhd:adhd /opt -R
git clone https://github.com/trustedsec/social-engineer-toolkit /opt/set
git clone https://github.com/rapid7/metasploit-framework /opt/metasploit
git clone https://github.com/adhdproject/webkit /var/www
apt-get -y install apache2 
chown www-data:www-data -R /var/www

