# ADHD Ansible Installation

In the interest of integrating the Active Defense philosophy into a
DevOps workflow, this is an attempt at creating an Ansible role for
ADHD.

## Who is it for?

Anyone that wants to play around with using the ADHD tools in their
environment or in the cloud.

## Requirements

- Some familiarity with [Ansible](https://www.ansible.com/get-started)
  and a working installation of the same using Python**3.5+**
- Access to either:
    - An Ubuntu 16.04 (**32-bit**) machine/VM
    - A working [DigitalOcean](http://www.digitalocean.com) account

### Installing Ansible

The easiest way to install ansible is via the Python packaging
program, `pip` and the virtual environment program, `virtualenv`.

- **macOS**
    - Get [Homebrew](https://brew.sh/)
    - `brew install python3`
    - `pip3 install virtualenv`
- **Ubuntu 16.04** or any other modern Deb-ish if doing remote install
    - `apt install python3 python3-pip`
    - `pip3 install virtualenv`
- **Windows**
    - Get [MiniConda for Python3](https://conda.io/miniconda.html)
    - From Anaconda Prompt: `conda install -c conda-forge ansible`
    - *Caveat Emptor*: I haven't played around with any of this on
      Windows

```
virtualenv adhd_env
source adhd_env/bin/activate
pip3 install -r requirements.txt
```

## AHDH in the Cloud (DigitalOcean)

You now have the tools to create a number of ADHD hosts in the cloud
using DigitalOcean. Below are some rough instructions to accomplish
this.

- Go to your DigitalOcean account and create an application token for
  your ADHD instance(s). Copy it.
- Initialize the `.tokenmanager.yml` token management file

```
python -m tokenmanager --init
```

- Edit `~/.tokenmanager.yml` and add the following YAML code:

```
digitalocean:
  adhd: <paste your app token here>
```

- Edit the `dowright.yml` file in this directory to match your needs

```yaml
token: adhd
prefix: adhd
droplets:
  # This ("data") is a droplet group that will be both a DigitalOcean
  # tag as well as an Ansible inventory group
  data:
    # Multiple nodes can be specified using Ansible's syntax
    - name: data[00:02]
      # you can provide shell commands in the list below that will be
      # executed on all created droplets once created
      cloud_config_commands:
        - apt update
        - apt install -y python python-pip python3 python3-pip
        - pip2 install --upgrade pip
        - pip3 install --upgrade pip
          
defaults:
  image: ubuntu-16-04-x32       # Currently, only this slug is supported
  size_slug: 1gb
  region: nyc1
  ssh_keys:
    # put your SSH key ids here
    - 439892
    - 438959
  private_networking: yes

domains:
  # make sure the domain listed here (e.g. mydomain.net) is one that
  # 1) you own and 2) is managed by DigitalOcean's DNS infrastructure
  mydomain.net:
    - type: A
      name: adhd-master         # i.e. adhd-master.mydomain.net

      data: data00              # this is the droplet name as written
                                # in the "droplets:" section above

    - type: A
      name: financialdata
      data: data01
    - type: A
      name: juicyinfo
      data: data02

# Here we specify the structure of the generated Ansible inventory
# file. 
inventory:
  name: hosts.conf              # Inventory filename
  groups:                       # Inventory groups
    adhd_master:
      hosts:
        - name: data00
    adhd:
      children:
        - name: data
```

- Run the `dowright` script. The below command will:
    1. Build the droplets and run their cloud configurations (`-b`)
    2. Wait until the build/config process completes (`-w`)
    3. Create the DNS entries for the created droplets (`-d`)
    4. Render an Ansible inventory file for the created droplets
       (`-i`)

```
python -m dowright dowright.yml -bwdi
```

- Run the `setup_adhd.yml` playbook:

```
ansible-playbook -i hosts.conf setup_adhd.yml
```

- Get a cup of coffee. Hopefully, after you've had a few draughts of
  the tasty beverage, you'll have a set of ADHD nodes to play with.

## Warning: Public Webkit

All of your AHDH nodes have Apache2 serving the ADHD webkit publicly
on port 80. This is the way the `adhd-install.sh` file does it, and as
this was a (semi) faithful representation of that script, it results
in the same outcome.

You might want to stop the apache2 service until you get your
bearings:

```
ansible -i hosts.conf adhd -m service -a 'name=apache2 state=stopped'
```

## Picking and Choosing ADHD Tools

You can modify the tools to be installed for any particular droplet or
groups of droplets by providing the following Ansible variable in a
host file in `host_vars` or a group file in `group_vars`:

```yaml
ansible_tool_names_to_install:
  - opencanary
  - cowrie
```

This will only install the tools listed on those droplets.

## Kludges

- beef: had to "fix" the json gem (forcing it to use the 'json_pure'
  package) reference so the beef package would `bundle update`
  correctly
