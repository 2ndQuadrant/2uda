Welcome to 2UDA - 2ndQuadrant's aUnified Data Analytics platform. 

The following lists defaults used as part of the installation process. If you did not change any values during 2UDA's install, the following list should hold true on your computer. 


Installation settings
=====================

Installation path      - _INSTALLATIONPATH_
Data directory path    - _DATADIRPATH_
PostgreSQL server Port - _PGPORT_
PostgreSQL super user  - postgres
Sample database name   - sample
Service name           - _SERVICENAME_


Features
========

2UDA comes with many build-in features some are listed below. In addition to these, many are in pipeline and will be available in upcoming releases.

- Orange
- PostGIS
- OpenSSL
- Python3
- Zlib
- LDAP
- ICU
- Perl
- Tcl

For more details please visit - https://www.2ndquadrant.com/en/resources/2uda/


Connecting Orange to PostgreSQL
===============================

NOTE: In order to establish connection with PostgreSQL you will need to install Psycopg2 first

You can connect Orange to PostgreSQL by following these simple steps: 

- Drag and drop the 'SQL Table' widget on the canvas
- Double click on this widget
- Provide database credentials in the following order:

  - Hostname      (default: localhost)
  - Database name (default: sample)
  - User name     (default: postgres)
  - Password

- Click the refresh button next to the table dropdown menu
- Select a table from the list or write a custom SQL, then close this dialog
- Drag and drop any of the data analysis widgets provided in the left pane
- Connect 'SQL table' to the analysis widget
- Double click the analysis widget
- Don't forget to have fun!

IMPORTANT: Some of the widgets in Orange require the 'tsm_system_time' and 'quantile' extensions to be available in the PostgreSQL database. The 'sample' database created at install time already has these extensions. If you create a new database, however, you will need to create these extensions to be able to use all Orange widgets. The extensions can be created by running the following simple commands on the database you have created: 

- CREATE EXTENSION tsm_system_time;
- CREATE EXTENSION quantile;


Bug Reports and Feedback
========================

For bug reports and  feedback, Please use our contact form here: https://www.2ndquadrant.com/en/resources/2uda/


Contact Us
==========

2ndQuadrant Ltd

7200 The Quorum
Oxford Business Park North
Oxford, OX4 2JZ
United Kingdom

Phone: +44 870 766 7756
Fax:   +44 870 838 1077
Email: info@2ndQuadrant.com

For detailed queries please visit our website: https://2ndQuadrant.com
