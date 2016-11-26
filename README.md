Updated on 11/25/2016 by Defilan. 
-Modified adhd-install.sh to accept argument for specific user. (Allows for automation)
-Modified adhd-install.sh to create ssh key (public/private) automatically without the need for a passcode (Allows for automation)

Currently, only Ubuntu versions 16.04 LTS and 15.10 32-bit are explicitly supported (installation may or may not work on a different version number).  We recommend you do a clean install before running the script here.

As always, read the script before blindly executing code from the internet but here is the one-liner to bootstrap your ADHD installation.

```
bash -c "$(curl -sL https://raw.githubusercontent.com/adhdproject/buildkit/master/adhd-install.sh)"
```

Alternatively, you can execute the interactive install with this line

```
bash -c "$(curl -sL https://raw.githubusercontent.com/adhdproject/buildkit/master/interactive-adhd-install.sh)"
```
