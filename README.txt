===================
scoreboard.buildout
===================
Scoreboard installation kit based on zc.buildout_


Updated install
---------------



Prerequisites - System packages
-------------------------------

These packages should be installed as superuser (root).

Debian based systems
~~~~~~~~~~~~~~~~~~~~

RHEL based systems
~~~~~~~~~~~~~~~~~~

Install Python2.7 with PUIAS: https://gist.github.com/nico4/9616638

Run these commands::

    curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python2.7 -

    pip2.7 install virtualenv
    pip2.7 install setuptools

    yum install git libffi-devel libxslt-devel


Product directory
-----------------

Create the product directory::

    mkdir -p /var/local/scoreboard

Create a new user::

    adduser edw

Change the product directory's owner::

    chown edw:edw /var/local/scoreboard -R

Setup
-----

Run the following commands as an unpriviledged user in the product directory::

    su edw
    cd /var/local/scoreboard


Clone the repository::

    git clone https://github.com/eaudeweb/scoreboard.buildout.git
    cd scoreboard.buildout

Switch to the development branch::

    git checkout devel

Create and activate the virtual environment::

    virtualenv-2.7 .
    ./bin/pip install -U pip
    ./bin/pip install -r requirements.txt


Production
----------

Run buildout::

    ln -s production.cfg buildout.cfg
    ./bin/buildout

Start application::

    bin/supervisord


Post-install management::

    ./bin/supervisorctl status


Development
-----------

Run buildout::

    ln -s devel.cfg buildout.cfg
    ./bin/buildout

Download and unzip data files::

    cd var
    wget http://test.digital-agenda-data.eu/download/datafs.test.tar.gz
    gunzip datafs.test.tar.gz
    tar xf datafs.test.tar

Start application::

    cd ../..
    bin/instance fg

Open application in browser: http://localhost:8440/Plone
