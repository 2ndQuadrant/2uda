# Copyright
2UDA installers code is copyright under GNU General Public License v3.0

# Overview
2ndQuadrant Unified Data Analytics - 2UDA is a multi-platform graphical and text mode one click installer. Its code is written in bitrock and tested with InstallBuilder19, You can generate installers for all 3 platforms i,e
- Windows
- MacOS
- Linux

To know more about 2UDA and its features please refer to 2UDA installers page on our website:
https://www.2ndquadrant.com/en/resources/2uda/

# Usage
This section will walk you through to generate a new installer please follow the steps mentioned below
In this example we are going to generate an installer for Linux(PostgreSQL 10.5)
Note: please make sure that you change/modify commands according to your needs 
- Download required PostgreSQL source code from	https://www.postgresql.org/ftp/source/
    - wget https://ftp.postgresql.org/pub/source/v10.5/postgresql-10.5.tar.gz
- Create directory with name of major version of the PostgreSQL
    - mkdir PostgreSQL-10
- Build PostgreSQL with your required features, and install it in directory which you have created in step 2
- Clone git repository
    - git clone https://github.com/2ndQuadrant/2uda-installer.git
- Create new directory(Builds) on root of the 2UDA repository
    - mkdir Builds
- Create new sub-directories inside Builds directory(this will reflect platforms for which you are going to generate a new installer. Folder names should be the same as bellow) i,e
    - Windows
    - Linux
    - MacOS
- Copy your build inside particular folder(We will copy it inside Linux)
    - cp -r 10/  Builds/Linux/
Note: If you do not put build in specific folder then installbuilder will fail to generate installer.
- Create a new directory inside Builds/Linux as Orange and put latest Orange binaries there
- Open  installer-properties.sh file and modify it as per your needs
    - vim installer-properties.sh
- Run autogen.sh this will generate 2UDA.xml file
    - ./autogen.sh
- Generate your installer for the choice of your platform using 2UDA.xml file 
    - (path-to-install-builder)bin/builder build 2UDA.xml linux --verbose
At the end you have your 2UDA installer in output directory of installbuilder

# Bugs and feedback
For bug reports and  feedback, Please use our contact form here: https://www.2ndquadrant.com/en/resources/2uda/
