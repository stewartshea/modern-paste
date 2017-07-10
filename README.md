[![](https://images.microbadger.com/badges/image/tlnk/modern-paste.svg)](https://microbadger.com/images/tlnk/modern-paste "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/tlnk/modern-paste.svg)](https://microbadger.com/images/tlnk/modern-paste "Get your own version badge on microbadger.com")

![Screenshot](http://i.imgur.com/BPvBFl2.png)

# Supported tags and respective

* latest [apache/Dockerfile](https://github.com/tle06/modern-paste/blob/master/Dockerfile)

This image is updated via pull requests to the tle06/modern-paste GitHub repo.

# Sources
[website](https://www.modernpaste.com/)

[github/Modern-paste](https://github.com/LINKIWI/modern-paste)

# What is modern paste
Modern Paste is intended for system administrators who wish to host their own installation of a code/text Pastebin on personal servers. It's free and open source: contributions from the developer community are encouraged and always welcome

**Modern Paste** is a self-hosted Pastebin alternative that is
+ Visually pleasing, with a contemporary and minimalistic user interface
+ Feature-rich
+ Mobile-friendly
+ Open source
+ Backed by a robust, RESTful API
+ Apache WSGI-friendly
+ Easy to install and highly configurable
+ [Impressively well-tested](https://coveralls.io/github/LINKIWI/modern-paste)

[**Live demo site**](https://demo.modernpaste.com)

## Features

+ Modern user interface with a consistent design language
+ Syntax highlighting for [all languages supported by CodeMirror](https://codemirror.net/mode/)
+ Ability to set paste expiration dates
+ Ability to password-protect pastes
+ Full user account functionality
	+ Associate new pastes with a user account
	+ View, modify, or delete pastes posted with a user account
	+ Directly query the Modern Paste API with the account's API key/authtoken
+ Public archive of pastes, sorted reverse chronologically or by popularity
+ RESTful API for externally creating, reading, and managing pastes
+ Ability to enforce security restrictions: can configure that only authenticated users can post pastes (ideal for private, non-public-facing installations)
+ Ability to encrypt the front-facing-display of paste IDs (e.g. so that `/paste/1` might display as `/paste/9~AEygplxfCPHW4eJctbjMnRi-rYnlYzizqToCmG3BY=`)

# Image configuration

* git
* make
* python3.5
* default-jre
* build-essential
* python-dev
* libmysqlclient-dev
* rubygems
* python-pip
* npm
* apache2
* libapache2-mod-wsgi
* nodejs-legacy

* port 80
* workdir = /var/www/modern-paste

# Available ENV variable

* __DOMAIN__ = exemple.com
* __DEFAULT_HTTPS__ = True
* __USE_ENCRYPTED_IDS__ = False
* __ENABLE_PASTE_ATTACHMENTS__ = True
* __MAX_ATTACHMENT_SIZE__ = 0
* __ATTACHMENTS_DIR__ = /var/www/modern-paste-attachments
* __DATABASE_HOST__ = localhost
* __DATABASE_NAME__ = modern_paste
* __DATABASE_USER__ = modern_paste
* __DATABASE_PASSWORD__ = mydbuserpassword
* __ENABLE_USER_REGISTRATION__ = True
* __REQUIRE_LOGIN_TO_PASTE__ : False

# How to use this image

## Prepare your SQL server
You will need to create a new MySQL user that has R/W privileges to the Modern Paste databases. (You may use the default `root` user, but it is highly recommended to create a separate user that only has access to the databases that Modern Paste will use.)
   First, generate a secure password for the new database user.
   ```bash
   $ pwgen -s 96 1
   ```
   Then, open up a session to your MySQL server as `root` (the below will prompt you for the `root` password to authenticate).
   ```bash
   $ mysql -u root -p
   ```
   You'll need to create the new user and all the databases Modern Paste will use. *If you only need a production environment and don't plan on running the unit tests on your local server, you may skip creation of the `dev` and `test` databases. However, it's recommended that you create all three.*
   ```sql
   CREATE USER 'modern_paste'@'localhost' IDENTIFIED BY '<password>';
   CREATE DATABASE modern_paste;
   CREATE DATABASE modern_paste_dev;
   CREATE DATABASE modern_paste_test;
   GRANT ALL ON modern_paste.* TO 'modern_paste'@'localhost';
   GRANT ALL ON modern_paste_dev.* TO 'modern_paste'@'localhost';
   GRANT ALL ON modern_paste_test.* TO 'modern_paste'@'localhost';
   FLUSH PRIVILEGES;
   ```
   `<password>` is the output of `pwgen` above, or your own password. Please be aware that this password will be stored in plain text in the Modern Paste configuration file.

## Start modern-paste

Starting the modern-paste instance listening on port 80 is as easy as the following:
``` Docker

$ docker run -d --restart=always -p 80:80 \
    -e DOMAIN=exemple.com \
    -e DATABASE_HOST=localhost \
    -e DATABASE_NAME=modern_paste \
    -e DATABASE_USER=modern_paste \
    -e DATABASE_PASSWORD=mydbuserpassword \
    tlnk/modern_paste

```
Then go to http://localhost/ and go through the wizard.

## Persistent data

All data beyond what lives in the database (file uploads, etc) is stored within the default volume /var/www/owncloud. With this volume, ownCloud will only be updated when the file version.php is not present.

* -v /`<mydatalocation>`:/var/www/modern-paste-attachments

## Via docker-compose

```
Docker
version: '2'

services:

modern-paste:
 image: tlnk/modern-paste
 ports:
   - 80:80
 environment:
    DOMAIN: exemple.com
    DATABASE_HOST: localhost
    DATABASE_NAME: modern_paste
    DATABASE_USER: modern_paste
    DATABASE_PASSWORD: mydbuserpassword 
```
