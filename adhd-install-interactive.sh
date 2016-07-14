#!/bin/bash

##Nee to somehow check if apt-get update works

## GLOBALS ##

# holds whether each tool selected or not
## this is ugly and i hate it but i can't figure it out now
#for i in {1...12}
#do
#    ${TOOLS[$i]}="false"
#done
declare -a TOOLS=(
"false" "false" "false" "false" "false" "false" "false" "false" "false" "false"
"false" "false" "false" "false" "false" "false" "false" "false" "false" "false"
"false" "false" "false" "false" "false" "false" "false" "false" "false" "false"
"false" "false" "false" "false" "false" "false" "false" "false" "false" "false"
"false" "false" "false" )

# the name of the tools. each tool has a constant value (see below) starting at
# '1' to match the menu screen. the first one here is "false" because arrays 
# start indexing at 0. it's a drag.
## I would like to use this for the actual individual install
declare -a TOOL_NAMES=(
"false" "artillery" "beartrap" "beef" "cowrie"
"creepy" "cryptolocked" "decloak" "defense-by-numbers" "denyhosts"
"docz.py" "gcat-poc" "gcat" "ghostwriting" "honeybadger"
"honeyports" "human.py" "invisiport" "jar-combiner" "java-web-attack"
"kippo" "lockdown" "nova" "OpenBAC" "oschameleon"
"PHP-HTTP-Tarpit" "portspoof" "psad" "recon-ng" "remux"
"rubberglue" "sidejack" "simple-pivot-detect" "spidertrap" "sqlitebugserver"
"sweeper" "TALOS" "tcprooter" "webbugserver" "weblabyrinth"
"whosthere" "windows-tools" "wordpot" )

# the number of tools
NUM_TOOLS=42

# constant variable for each tool to access the tool set
ARTILLERY=1
BEARTRAP=2
BEEF=3
COWRIE=4
CREEPY=5
CRYPTOLOCKED=6
DECLOAK=7
DEFENSEBYNUMBERS=8
DENYHOSTS=9
DOCZPY=10
GCATPOC=11
GCAT=12
GHOSTWRITING=13
HONEYBADGER=14
HONEYPORTS=15
HUMANPY=16
INVISIPORT=17
JARCOMBINER=18
JAVAWEBATTACK=19
KIPPO=20
LOCKDOWN=21
NOVA=22
OPENBAC=23
OSCHAMELEON=24
PHPHTTPTARPIT=25
PORTSPOOF=26
PSAD=27
RECONNG=28
REMUX=29
RUBBERGLUE=30
SIDEJACK=31
SIMPLEPIVOTDETECT=32
SPIDERTRAP=33
SQLITEBUGSERVER=34
SWEEPER=35
TALOS=36
TCPROOTER=37
WEBBUGSERVER=38
WEBLABYRINTH=39
WHOSTHERE=40
WINDOWSTOOLS=41
WORDPOT=42

# colors
GREEN='\033[1;32m'
NC='\033[0m'
YELLOW='\033[1;33m'

## FUNCTIONS ##

select_tools ()
{
    # clear the screen
    tput clear

    # grab the current size of the terminal
    # adjust measurements
    cols=$(tput cols)
    
    # positions for the headers
    let center=${cols}/2
    let head1_center=${center}-5
    let head2_center=${center}-7
    
    # space between the columns
    let col_space=(${cols}-45)/4

    # the indent for each column   
    let col1_ind=${col_space}
    let col2_ind=${col_space}*2+15
    let col3_ind=${col_space}*3+30

    # indents for the bottom row
    let bot_col1_ind=${col1_ind}/2
    let bot_col2_ind=(${col2_ind}-${col1_ind})/2+${col1_ind}
    let bot_col3_ind=(${col3_ind}-${col2_ind})/2+${col2_ind}


    # Set the headings
    # move cursor to screen location (y,x)
    tput cup 3 ${head1_center}
    #tput setaf 3
    echo -e "${YELLOW}ADHD 0.7.1${NC}"
    tput sgr0

    tput cup 5 ${head2_center}
    #tput rev
    echo -e "${YELLOW}Welcome to ADHD${NC}"
    tput sgr0

    # write the options
    # check if the tool is selected so it can be highlighted green
    # first column
    tput cup 7 ${col1_ind}
    if [ "${TOOLS[ARTILLERY]}" == "true" ]
    then
        echo -e "${GREEN}${ARTILLERY}) Artillery${NC}"
    else
        echo "${ARTILLERY}) Artillery"
    fi

    tput cup 8 ${col1_ind}
    if [ "${TOOLS[BEARTRAP]}" == "true" ]
    then
        echo -e "${GREEN}${BEARTRAP}) BearTrap${NC}"
    else
        echo "${BEARTRAP}) BearTrap"
    fi

    tput cup 9 ${col1_ind}
    if [ "${TOOLS[BEEF]}" == "true" ]
    then
        echo -e "${GREEN}${BEEF}) BeEF${NC}"
    else
        echo "${BEEF}) BeEF"
    fi

    tput cup 10 ${col1_ind}
    if [ "${TOOLS[COWRIE]}" == "true" ]
    then
        echo -e "${GREEN}${COWRIE}) Cowire${NC}"
    else
        echo "${COWRIE}) Cowire"
    fi

    tput cup 11 ${col1_ind}
    if [ "${TOOLS[CREEPY]}" == "true" ]
    then
        echo -e "${GREEN}${CREEPY}) Creepy${NC}"
    else
        echo "${CREEPY}) Creepy"
    fi

    tput cup 12 ${col1_ind}
    if [ "${TOOLS[CRYPTOLOCKED]}" == "true" ]
    then
        echo -e "${GREEN}${CRYPTOLOCKED}) Cryptolocked${NC}"
    else
        echo "${CRYPTOLOCKED}) Cryptolocked"
    fi

    tput cup 13 ${col1_ind}
    if [ "${TOOLS[DECLOAK]}" == "true" ]
    then
        echo -e "${GREEN}${DECLOAK}) Decloak${NC}"
    else
        echo "${DECLOAK}) Decloak"
    fi

    tput cup 14 ${col1_ind}
    if [ "${TOOLS[DEFENSEBYNUMBERS]}" == "true" ]
    then
        echo -e "${GREEN}${DEFENSEBYNUMBERS}) Defense By Numbers${NC}"
    else
        echo "${DEFENSEBYNUMBERS}) Defense By Numbers"
    fi

    tput cup 15 ${col1_ind}
    if [ "${TOOLS[DENYHOSTS]}" == "true" ]
    then
        echo -e "${GREEN}${DENYHOSTS}) DenyHosts${NC}"
    else
        echo "${DENYHOSTS}) DenyHosts"
    fi

    tput cup 16 ${col1_ind}
    if [ "${TOOLS[DOCZPY]}" == "true" ]
    then
        echo -e "${GREEN}${DOCZPY}) Docz.py${NC}"
    else
        echo "${DOCZPY}) Docz.py"
    fi

    tput cup 17 ${col1_ind}
    if [ "${TOOLS[GCATPOC]}" == "true" ]
    then
        echo -e "${GREEN}${GCATPOC}) GCat-POC${NC}"
    else
        echo "${GCATPOC}) GCat-POC"
    fi

    tput cup 18 ${col1_ind}
    if [ "${TOOLS[GCAT]}" == "true" ]
    then
        echo -e "${GREEN}${GCAT}) GCat${NC}"
    else
        echo "${GCAT}) GCat"
    fi

    tput cup 19 ${col1_ind}
    if [ "${TOOLS[GHOSTWRITING]}" == "true" ]
    then
        echo -e "${GREEN}${GHOSTWRITING}) Ghostwriting${NC}"
    else
        echo "${GHOSTWRITING}) Ghostwriting"
    fi

    tput cup 20 ${col1_ind}
    if [ "${TOOLS[HONEYBADGER]}" == "true" ]
    then
        echo -e "${GREEN}${HONEYBADGER}) Honeybadger${NC}"
    else
        echo "${HONEYBADGER}) Honeybadger"
    fi

    # second column
    tput cup 7 ${col2_ind}
    if [ "${TOOLS[HONEYPORTS]}" == "true" ]
    then
        echo -e "${GREEN}${HONEYPORTS}) Honeyports${NC}"
    else
        echo "${HONEYPORTS}) Honeyports"
    fi

    tput cup 8 ${col2_ind}
    if [ "${TOOLS[HUMANPY]}" == "true" ]
    then
        echo -e "${GREEN}${HUMANPY}) Human.py${NC}"
    else
        echo "${HUMANPY}) Human.py"
    fi

    tput cup 9 ${col2_ind}
    if [ "${TOOLS[INVISIPORT]}" == "true" ]
    then
        echo -e "${GREEN}${INVISIPORT}) Invisiport${NC}"
    else
        echo "${INVISIPORT}) Invisiport"
    fi

    tput cup 10 ${col2_ind}
    if [ "${TOOLS[JARCOMBINER]}" == "true" ]
    then
        echo -e "${GREEN}${JARCOMBINER}) Jar-Combiner${NC}"
    else
        echo "${JARCOMBINER}) Jar-Combiner"
    fi

    tput cup 11 ${col2_ind}
    if [ "${TOOLS[JAVAWEBATTACK]}" == "true" ]
    then
        echo -e "${GREEN}${JAVAWEBATTACK}) Java Web Attack${NC}"
    else
        echo "${JAVAWEBATTACK}) Java Web Attack"
    fi

    tput cup 12 ${col2_ind}
    if [ "${TOOLS[KIPPO]}" == "true" ]
    then
        echo -e "${GREEN}${KIPPO}) Kippo${NC}"
    else
        echo "${KIPPO}) Kippo"
    fi

    tput cup 13 ${col2_ind}
    if [ "${TOOLS[LOCKDOWN]}" == "true" ]
    then
        echo -e "${GREEN}${LOCKDOWN}) Lockdown${NC}"
    else
        echo "${LOCKDOWN}) Lockdown"
    fi

    tput cup 14 ${col2_ind}
    if [ "${TOOLS[NOVA]}" == "true" ]
    then
        echo -e "${GREEN}${NOVA}) Nova${NC}"
    else
        echo "${NOVA}) Nova"
    fi

    tput cup 15 ${col2_ind}
    if [ "${TOOLS[OPENBAC]}" == "true" ]
    then
        echo -e "${GREEN}${OPENBAC}) OpenBAC${NC}"
    else
        echo "${OPENBAC}) OpenBAC"
    fi

    tput cup 16 ${col2_ind}
    if [ "${TOOLS[OSCHAMELEON]}" == "true" ]
    then
        echo -e "${GREEN}${OSCHAMELEON}) Oschameleon${NC}"
    else
        echo "${OSCHAMELEON}) Oschameleon"
    fi

    tput cup 17 ${col2_ind}
    if [ "${TOOLS[PHPHTTPTARPIT]}" == "true" ]
    then
        echo -e "${GREEN}${PHPHTTPTARPIT}) PHP-HTTP-Tarpit${NC}"
    else
        echo "${PHPHTTPTARPIT}) PHP-HTTP-Tarpit"
    fi

    tput cup 18 ${col2_ind}
    if [ "${TOOLS[PORTSPOOF]}" == "true" ]
    then
        echo -e "${GREEN}${PORTSPOOF}) Portspoof${NC}"
    else
        echo "${PORTSPOOF}) Portspoof"
    fi

    tput cup 19 ${col2_ind}
    if [ "${TOOLS[PSAD]}" == "true" ]
    then
        echo -e "${GREEN}${PSAD}) PSAD${NC}"
    else
        echo "${PSAD}) PSAD"
    fi

    tput cup 20 ${col2_ind}
    if [ "${TOOLS[RECONNG]}" == "true" ]
    then
        echo -e "${GREEN}${RECONNG}) Recon-ng${NC}"
    else
        echo "${RECONNG}) Recon-ng"
    fi

    # third column
    tput cup 7 ${col3_ind}
    if [ "${TOOLS[REMUX]}" == "true" ]
    then
        echo -e "${GREEN}${REMUX}) Remux${NC}"
    else
        echo "${REMUX}) Remux"
    fi

    # third column
    tput cup 8 ${col3_ind}
    if [ "${TOOLS[RUBBERGLUE]}" == "true" ]
    then
        echo -e "${GREEN}${RUBBERGLUE}) Rubberglue${NC}"
    else
        echo "${RUBBERGLUE}) Ruberglue"
    fi

    tput cup 9 ${col3_ind}
    if [ "${TOOLS[SIDEJACK]}" == "true" ]
    then
        echo -e "${GREEN}${SIDEJACK}) Sidejack${NC}"
    else
        echo "${SIDEJACK}) Sidejack"
    fi

    tput cup 10 ${col3_ind}
    if [ "${TOOLS[SIMPLEPIVOTDETECT]}" == "true" ]
    then
        echo -e "${GREEN}${SIMPLEPIVOTDETECT}) Simple-Pivot-Detect${NC}"
    else
        echo "${SIMPLEPIVOTDETECT}) Simple-Pivot-Detect"
    fi

    tput cup 11 ${col3_ind}
    if [ "${TOOLS[SPIDERTRAP]}" == "true" ]
    then
        echo -e "${GREEN}${SPIDERTRAP}) Spidertrap${NC}"
    else
        echo "${SPIDERTRAP}) Spidertrap"
    fi

    tput cup 12 ${col3_ind}
    if [ "${TOOLS[SQLITEBUGSERVER]}" == "true" ]
    then
        echo -e "${GREEN}${SQLITEBUGSERVER}) SQLite Bug Server${NC}"
    else
        echo "${SQLITEBUGSERVER}) SQLite Bug Server"
    fi

    tput cup 13 ${col3_ind}
    if [ "${TOOLS[SWEEPER]}" == "true" ]
    then
        echo -e "${GREEN}${SWEEPER}) Sweeper${NC}"
    else
        echo "${SWEEPER}) Sweeper"
    fi

    tput cup 14 ${col3_ind}
    if [ "${TOOLS[TALOS]}" == "true" ]
    then
        echo -e "${GREEN}${TALOS}) TALOS${NC}"
    else
        echo "${TALOS}) TALOS"
    fi

    tput cup 15 ${col3_ind}
    if [ "${TOOLS[TCPROOTER]}" == "true" ]
    then
        echo -e "${GREEN}${TCPROOTER}) TCPRooter${NC}"
    else
        echo "${TCPROOTER}) TCPRooter"
    fi

    tput cup 16 ${col3_ind}
    if [ "${TOOLS[WEBBUGSERVER]}" == "true" ]
    then
        echo -e "${GREEN}${WEBBUGSERVER}) Web Bug Server${NC}"
    else
        echo "${WEBBUGSERVER}) Web Bug Server"
    fi

    tput cup 17 ${col3_ind}
    if [ "${TOOLS[WEBLABYRINTH]}" == "true" ]
    then
        echo -e "${GREEN}${WEBLABYRINTH}) Weblabyrinth${NC}"
    else
        echo "${WEBLABYRINTH}) Weblabyrinth"
    fi

    tput cup 18 ${col3_ind}
    if [ "${TOOLS[WHOSTHERE]}" == "true" ]
    then
        echo -e "${GREEN}${WHOSTHERE}) Who's There${NC}"
    else
        echo "${WHOSTHERE}) Who's There"
    fi

    tput cup 19 ${col3_ind}
    if [ "${TOOLS[WINDOWSTOOLS]}" == "true" ]
    then
        echo -e "${GREEN}${WINDOWSTOOLS}) Windows-Tools${NC}"
    else
        echo "${WINDOWSTOOLS}) Windows-Tools"
    fi

    tput cup 20 ${col3_ind}
    if [ "${TOOLS[WORDPOT]}" == "true" ]
    then
        echo -e "${GREEN}${WORDPOT}) Wordpot${NC}"
    else
        echo "${WORDPOT}) Wordpot"
    fi

    # Bottom Row

    tput cup 23 ${bot_col1_ind}
    echo "99) Quit"

    tput cup 23 ${bot_col2_ind}
    echo "100) Default Install"

    tput cup 23 ${bot_col3_ind}
    echo "101) Install Selected Tools"

    # prompt user to select tools
    tput bold
    tput cup 25 15
    read -p "Which tools to install?: " tool_num
    # highlights the tool that was selected
    # i want to be able to unselect items at some point
    case $tool_num in
        [123456789]|1[0123456789]|2[0123456789]|3[0123456789]|4[012345])
            #d="$TOOLS[1]";
            #if [ "$d" == "false" ];
            #then 
            #    TOOLS[${tool_num}]="true"
            #fi
            #;;
            ##The line below works
            #TOOLS[${tool_num}]="true"; continue;;
            TOOLS[${tool_num}]="true"; select_tools;;
        # not adding tools.
        # quiting, installing selected tools, or default install
        99|10[01]|q ) return $tool_num;;
        * ) select_tools;;
    esac
}

# perform the default install
default_install()
{
    apt-get update

    #install git
    apt-get -y install git

    #general dependencies
    apt-get -y install sqlite3 sqlite

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
        echo "deb  https://cdn.rawgit.com/adhdproject/neoadhd/master ./" >> /etc/apt/sources.list
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

}

selected_install ()
{
    ##put in some check to see if there actually are tools that are selected

    apt-get update

    #install git
    apt-get -y install git

    #general dependencies
    apt-get -y install sqlite3 sqlite

    cd /
    mkdir adhd
    cd adhd
    mkdir 1-annoyance
    mkdir 2-attribution
    mkdir 3-absolution
    mkdir 4-attack
    cd /
    if [ "${TOOLS[ARTILLERY]}" == "true" ]
    then
        ln -s /opt/artillery /adhd/1-annoyance/artillery
    fi
    if [ "${TOOLS[BEARTRAP]}" == "true" ]
    then
        ln -s /opt/beartrap /adhd/1-annoyance/beartrap
    fi
    if [ "${TOOLS[BEEF]}" == "true" ]
    then
        ln -s /opt/beef /adhd/4-attack/beef
    fi
    if [ "${TOOLS[COWIRE]}" == "true" ]
    then
        ln -s /opt/cowrie /adhd/1-annoyance/cowrie
    fi
    if [ "${TOOLS[CREEPY]}" == "true" ]
    then
        ln -s /opt/creepy /adhd/2-attribution/creepy
    fi
    if [ "${TOOLS[CRYPTOLOCKED]}" == "true" ]
    then
        ln -s /opt/cryptolocked /adhd/1-annoyance/cryptolocked
    fi
    if [ "${TOOLS[DECLOAK]}" == "true" ]
    then
        ln -s /opt/decloak /adhd/2-attribution/decloak
    fi
    if [ "${TOOLS[DEFENSEBYNUMBERS]}" == "true" ]
    then
        ln -s /opt/defense_by_numbers /adhd/1-annoyance/defense_by_numbers
    fi
    if [ "${TOOLS[DENYHOSTS]}" == "true" ]
    then
        ln -s /opt/denyhosts /adhd/1-annoyance/denyhosts
    fi
    if [ "${TOOLS[DOCZPY]}" == "true" ]
    then
        ln -s /opt/docz.py /adhd/2-attribution/docz.py
    fi
    if [ "${TOOLS[GCAT]}" == "true" ]
    then
        ln -s /opt/gcat /adhd/4-attack/gcat
    fi
    if [ "${TOOLS[GHOSTWRITING]}" == "true" ]
    then
        ln -s /opt/ghostwriting /adhd/4-attack/ghostwriting
    fi
    if [ "${TOOLS[HONEYBADGER]}" == "true" ]
    then
        ln -s /opt/honeybadger /adhd/2-attribution/honeybadger
    fi
    if [ "${TOOLS[HUMANPY]}" == "true" ]
    then
        ln -s /opt/human.py /adhd/3-absolution/human.py
    fi
    if [ "${TOOLS[INVISIPORT]}" == "true" ]
    then
        ln -s /opt/invisiport /adhd/1-annoyance/invisiport
    fi
    if [ "${TOOLS[JARCOMBINER]}" == "true" ]
    then
        ln -s /opt/jar-combiner /adhd/2-attribution/jar-combiner
    fi
    if [ "${TOOLS[JAVAWEBATTACK]}" == "true" ]
    then
        ln -s /opt/java-web-attack /adhd/4-attack/java-web-attack
    fi
    if [ "${TOOLS[KIPPO]}" == "true" ]
    then
        ln -s /opt/kippo /adhd/1-annoyance/kippo
    fi
    if [ "${TOOLS[LOCKDOWN]}" == "true" ]
    then
        ln -s /opt/lockdown /adhd/3-absolution/lockdown
    fi
    if [ "${TOOLS[TALOS]}" == "true" ]
    then
        ln -s /opt/TALOS /adhd/3-absolution/TALOS
    fi
    if [ "${TOOLS[NOVA]}" == "true" ]
    then
        ln -s /opt/nova /adhd/1-annoyance/nova
    fi
    if [ "${TOOLS[OPENBAC]}" == "true" ]
    then
        ln -s /opt/OpenBAC /adhd/3-absolution/OpenBAC
    fi
    if [ "${TOOLS[OSCHAMELEON]}" == "true" ]
    then
        ln -s /opt/oschameleon /adhd/1-annoyance/oschameleon
    fi
    if [ "${TOOLS[PHPHTTPTARPIT]}" == "true" ]
    then
        ln -s /opt/PHP-HTTP-Tarpit /adhd/1-annoyance/PHP-HTTP-Tarpit
    fi
    if [ "${TOOLS[PORTSPOOF]}" == "true" ]
    then
        ln -s /opt/portspoof /adhd/1-annoyance/portspoof
    fi
    if [ "${TOOLS[PSAD]}" == "true" ]
    then
        ln -s /opt/psad /adhd/1-annoyance/psad
    fi
    if [ "${TOOLS[RECONNG]}" == "true" ]
    then
        ln -s /opt/recon-ng /adhd/4-attack/recon-ng
    fi
    if [ "${TOOLS[REMUX]}" == "true" ]
    then
        ln -s /opt/remux /adhd/1-annoyance/remux
    fi
    if [ "${TOOLS[RUBBERGLUE]}" == "true" ]
    then
        ln -s /opt/rubberglue /adhd/1-annoyance/rubberglue
    fi
    if [ "${TOOLS[SIDEJACK]}" == "true" ]
    then
        ln -s /opt/sidejack /adhd/4-attack/sidejack
    fi
    if [ "${TOOLS[SIMPLEPIVOTDETECT]}" == "true" ]
    then
        ln -s /opt/simple-pivot-detect /adhd/3-absolution/simple-pivot-detect
    fi
    if [ "${TOOLS[SQLITEBUGSERVER]}" == "true" ]
    then
        ln -s /opt/sqlitebugserver /adhd/2-attribution/sqlitebugserver
    fi
    if [ "${TOOLS[SPIDERTRAP]}" == "true" ]
    then
        ln -s /opt/spidertrap /adhd/1-annoyance/spidertrap
    fi
    if [ "${TOOLS[SWEEPER]}" == "true" ]
    then
        ln -s /opt/sweeper /adhd/3-absolution/sweeper
    fi
    if [ "${TOOLS[TCPROOTER]}" == "true" ]
    then
        ln -s /opt/tcprooter /adhd/1-annoyance/tcprooter
    fi
    if [ "${TOOLS[WEBBUGSERVER]}" == "true" ]
    then
        ln -s /opt/webbugserver /adhd/2-attribution/webbugserver
    fi
    if [ "${TOOLS[WEBLABYRINTH]}" == "true" ]
    then
        ln -s /opt/weblabyrinth /adhd/1-annoyance/weblabyrinth
    fi
    if [ "${TOOLS[WHOSTHERE]}" == "true" ]
    then
        ln -s /opt/whosthere /adhd/2-attribution/whosthere
    fi
    if [ "${TOOLS[WINDOWSTOOLS]}" == "true" ]
    then
        ln -s /opt/windows-tools /adhd/1-annoyance/windows-tools
    fi
    if [ "${TOOLS[WORDPOT]}" == "true" ]
    then
        ln -s /opt/wordpot /adhd/1-annoyance/wordpot
    fi

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
    if [ "${TOOLS[CREEPY]}" == "true" ]
    then
        apt-get -y install python-qt4 python-pip
        pip install pytz python-qt flickrapi python-instagram yapsy tweepy google-api-python-client python-dateutil configobj dominate
    fi

    #dependencies for lockdown
    if [ "${TOOLS[LOCKDOWN]}" == "true" ]
    then
        pip install splinter
    fi

    #dependencies for whosthere
    if [ "${TOOLS[WHOSTHERE]}" == "true" ]
    then
        apt-get -y install golang-go
    fi

    #dependencies for wordpot
    if [ "${TOOLS[WORDPOT]}" == "true" ]
    then
        pip install flask
    fi

    #beartrap
    if [ "${TOOLS[BEARTRAP]}" == "true" ]
    then
        apt-get -y install ruby
        gem install getopt
    fi

    #beef
    if [ "${TOOLS[BEEF]}" == "true" ]
    then
        gem install bundler
        apt-get -y install ruby-dev libsqlite3-dev libsqlite-dev
    fi

    #decloak
    if [ "${TOOLS[DECLOAK]}" == "true" ]
    then
        apt-get -y install openjdk-7-jdk
    fi

    #database mysql
    ## need this for everything??
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

    # This is where the installing magic happens
    # package has filename X
    # adhd-X
    ## I would really like to clean this, be able to do a loop with the 
    ## array of tools and their tool names, but for now, I'm going to
    ## have to hardcode until I have a definite list of package names.
    if ! grep -q 'neoadhd' /etc/apt/sources.list; then
        echo "deb  https://cdn.rawgit.com/adhdproject/neoadhd/master ./" >> /etc/apt/sources.list
    fi
    apt-get update
    #apt-get -y --force-yes install adhd-*
    if [ "${TOOLS[OPENBAC]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-OpenBAC
    fi
    if [ "${TOOLS[PHPHTTPTARPIT]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-PHP-HTTP-Tarpit
    fi
    if [ "${TOOLS[TALOS]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-TALOS
    fi
    if [ "${TOOLS[ARTILLERY]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-artillery
    fi
    if [ "${TOOLS[BEARTRAP]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-beartrap
    fi
    if [ "${TOOLS[BEEF]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-beef
    fi
    if [ "${TOOLS[COWRIE]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-cowrie
    fi
    if [ "${TOOLS[CREEPY]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-creepy
    fi
    if [ "${TOOLS[CRYPTOLOCKED]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-cryptolocked
    fi
    if [ "${TOOLS[DECLOAK]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-decloak
    fi
    if [ "${TOOLS[DEFENSEBYNUMBERS]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-defense-by-numbers
    fi
    if [ "${TOOLS[DENYHOSTS]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-denyhosts
    fi
    if [ "${TOOLS[DOCZPY]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-docz.py
    fi
    if [ "${TOOLS[GCATPOC]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-gcat-poc
    fi
    if [ "${TOOLS[GCAT]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-gcat
    fi
    if [ "${TOOLS[GHOSTWRITING]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-ghostwriting
    fi
    if [ "${TOOLS[HONEYBADGER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-honeybadger
    fi
    if [ "${TOOLS[HONEYPORTS]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-honeyports
    fi
    if [ "${TOOLS[HUMANPY]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-human.py
    fi
    if [ "${TOOLS[INVISIPORT]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-invisiport
    fi
    if [ "${TOOLS[JARCOMBINER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-jar-combiner
    fi
    if [ "${TOOLS[JAVAWEBATTACK]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-java-web-attack
    fi
    if [ "${TOOLS[KIPPO]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-kippo
    fi
    if [ "${TOOLS[LOCKDOWN]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-lockdown
    fi
    if [ "${TOOLS[NOVA]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-nova
    fi
    if [ "${TOOLS[OSCHAMELEON]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-oschameleon
    fi
    if [ "${TOOLS[PORTSPOOF]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-portspoof
    fi
    if [ "${TOOLS[PSAD]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-psad
    fi
    if [ "${TOOLS[RECONNG]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-recon-ng
    fi
    if [ "${TOOLS[REMUX]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-remux
    fi
    if [ "${TOOLS[RUBBERGLUE]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-rubberglue
    fi
    if [ "${TOOLS[SIDEJACK]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-sidejack
    fi
    if [ "${TOOLS[SIMPLEPIVOTDETECT]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-simple-pivot-detect
    fi
    if [ "${TOOLS[SPIDERTRAP]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-spidertrap
    fi
    if [ "${TOOLS[SQLITEBUGSERVER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-sqlitebugserver
    fi
    if [ "${TOOLS[SWEEPER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-sweeper
    fi
    if [ "${TOOLS[TCPROOTER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-tcprooter
    fi
    if [ "${TOOLS[WEBBUGSERVER]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-webbugserver
    fi
    if [ "${TOOLS[WEBLABYRINTH]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-weblabyrinth
    fi
    if [ "${TOOLS[WHOSTHERE]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-whosthere
    fi
    if [ "${TOOLS[WINDOWSTOOLS]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-windows-tools
    fi
    if [ "${TOOLS[WORDPOT]}" == "true" ]
    then
        apt-get -y --force-yes install adhd-wordpot
    fi

    #post install beef
    if [ "${TOOLS[BEEF]}" == "true" ]
    then
        cd /opt/beef
        bundle install
    fi

    #post install www
    chown www-data:www-data /var/www -R

    #post kippo
    if [ "${TOOLS[KIPPO]}" == "true" ]
    then
        apt-get -y install python-twisted
    fi

    #Install portspoof
    if [ "${TOOLS[PORTSPOOF]}" == "true" ]
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
}

## MAIN ##

# check if ran as root
if [ `whoami` != 'root' ]; then
echo "Need to run as root, or with sudo"; exit
fi

# user select which tools to install
select_tools
install_type=$?
#echo "Return value is $install_type"

# based on the user, how to install
case $install_type in
    10[0] ) default_install;;
    10[1] ) selected_install;;
    99 ) clear; exit;;
    * ) ;;
esac

##just clear for right now
#tput clear
#clear
tput sgr0
tput rc

