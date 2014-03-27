===================
scoreboard.buildout
===================
Scoreboard installation kit based on zc.buildout_

Prerequisites - System packages
-------------------------------

These packages should be installed as superuser (root).

Debian based systems
~~~~~~~~~~~~~~~~~~~~

RHEL based systems
~~~~~~~~~~~~~~~~~~

Run these commands::

    yum groupinstall -y 'development tools'
    yum install -y zlib-devel bzip2-devel openssl-devel xz-libs wget

    wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz --no-check-certificate
    xz -d Python-2.7.6.tar.xz
    tar -xvf Python-2.7.6.tar

    cd Python-2.7.6

    ./configure --prefix=/usr/local

    make
    make altinstall

    export PATH="/usr/local/bin:$PATH"

    cd ..

    wget --no-check-certificate \
    https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz

    tar -xvf setuptools-1.4.2.tar.gz
    cd setuptools-1.4.2

    python2.7 setup.py install

    cd ..

    curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python2.7 -

    pip2.7 install virtualenv
    pip install setuptools==2.1

    yum install git
    yum install libffi-devel
    yum install libxslt-devel


Product directory
-----------------
                                                                                
Create the product directory::                                                  
                                                                                
    mkdir -p /var/local/scoreboard
                                                                                
Create a new user::                                                             
                                                                                
    adduser edw                                                                 
                                                                                
Change the product directory's owner::                                          
                                                                                
    chown edw:edw /var/local/scoreboard -R    

Installation
------------

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
    source bin/activate

Run buildout::

    python bootstrap.py -c devel.cfg
    bin/buildout -c devel.cfg

Download and unzip data files::

    cd var/filestorage/
    wget http://scoreboardtest.edw.ro/download/Data.fs.gz
    wget http://scoreboardtest.edw.ro/download/filestorage.tar.gz
    wget http://scoreboardtest.edw.ro/download/blobstorage.tar.gz

    gunzip Data.fs.gz
    tar xf filestorage.tar.gz
    tar xf blobstorage.tar.gz

Start application::
    
    cd ../..
    bin/instance fg

Open application in browser: http://localhost:8440/Plone
