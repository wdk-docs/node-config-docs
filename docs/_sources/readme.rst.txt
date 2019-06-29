Configure your Node.js Applications
===================================

|NPM|   |Build Status|   `release
notes <https://github.com/lorenwest/node-config/blob/master/History.md>`_

Introduction
------------

Node-config organizes hierarchical configurations for your app
deployments.

It lets you define a set of default parameters, and extend them for
different deployment environments (development, qa, staging, production,
etc.).

Configurations are stored in :doc:`Configuration-Files`
within your application, and can be overridden and extended by
:doc:`Environment-Variables`, :doc:`Command-Line-Overrides`,
or :doc:`Configuring-from-an-External-Source`.

This gives your application a consistent configuration interface shared
among a `growing list of npm modules <https://www.npmjs.org/browse/depended/config>`_ also using
node-config.

Project Guidelines
------------------

-  *Simple* - Get started fast
-  *Powerful* - For multi-node enterprise deployment
-  *Flexible* - Supporting multiple config file formats
-  *Lightweight* - Small file and memory footprint
-  *Predictable* - Well tested foundation for module and app developers

Quick Start
-----------

The following examples are in JSON format, but configurations can be in
other :ref:`Configuration-Files-file-formats`.

**Install in your app directory, and edit the default config file.**

.. code:: shell

   $ npm install config
   $ mkdir config
   $ vi config/default.json

.. code:: js

   {
     // Customer module configs
     "Customer": {
       "dbConfig": {
         "host": "localhost",
         "port": 5984,
         "dbName": "customers"
       },
       "credit": {
         "initialLimit": 100,
         // Set low for development
         "initialDays": 1
       }
     }
   }

**Edit config overrides for production deployment:**

.. code:: shell

    $ vi config/production.json

.. code:: json

   {
     "Customer": {
       "dbConfig": {
         "host": "prod-db-server"
       },
       "credit": {
         "initialDays": 30
       }
     }
   }

**Use configs in your code:**

.. code:: js

   const config = require('config');
   //...
   const dbConfig = config.get('Customer.dbConfig');
   db.connect(dbConfig, ...);

   if (config.has('optionalFeature.detail')) {
     const detail = config.get('optionalFeature.detail');
     //...
   }

``config.get()`` will throw an exception for undefined keys to help
catch typos and missing values. Use ``config.has()`` to test if a
configuration value is defined.

**Start your app server:**

.. code:: shell

   $ export NODE_ENV=production
   $ node my-app.js

Running in this configuration, the ``port`` and ``dbName`` elements of
``dbConfig`` will come from the ``default.json`` file, and the ``host``
element will come from the ``production.json`` override file.

Articles
--------

-  :doc:`Configuration-Files`

   -  :doc:`Special-features-for-JavaScript-configuration-files`

-  :doc:`Common-Usage`
-  :doc:`Environment-Variables`
-  :doc:`Reserved-Words`
-  :doc:`Command-Line-Overrides`
-  :doc:`Multiple-Node-Instances`
-  :doc:`Sub-Module-Configuration`
-  :doc:`Configuring-from-an-External-Source`
-  :doc:`Securing-Production-Config-Files`
-  :doc:`External-Configuration-Management-Tools`
-  :doc:`Examining-Configuration-Sources`
-  :doc:`Using-Config-Utilities`
-  :doc:`Upgrading-From-Config-0.x`
-  :doc:`Webpack-Usage`

Further Information
-------------------

If you still don’t see what you are looking for, here more resources to check:

-  The `wiki may have more pages <https://github.com/lorenwest/node-config/wiki>`_ which are not directly linked from here.
-  Review `questions tagged with node-config <https://stackexchange.com/filters/207096/node-config>`_
   on StackExchange. These are monitored by ``node-config`` contributors.
-  `Search the issue tracker <https://github.com/lorenwest/node-config/issues>`_.
   Hundreds of issues have already been discussed and resolved there.

Contributors
------------

.. raw:: html

   <table id="contributors">

.. raw:: html

   <tr>

.. raw:: html

   <td>

lorenwest

.. raw:: html

   </td>

.. raw:: html

   <td>

markstos

.. raw:: html

   </td>

.. raw:: html

   <td>

elliotttf

.. raw:: html

   </td>

.. raw:: html

   <td>

jfelege

.. raw:: html

   </td>

.. raw:: html

   <td>

leachiM2k

.. raw:: html

   </td>

.. raw:: html

   <td>

josx

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   <tr>

.. raw:: html

   <td>

enyo

.. raw:: html

   </td>

.. raw:: html

   <td>

arthanzel

.. raw:: html

   </td>

.. raw:: html

   <td>

eheikes

.. raw:: html

   </td>

.. raw:: html

   <td>

th507

.. raw:: html

   </td>

.. raw:: html

   <td>

Osterjour

.. raw:: html

   </td>

.. raw:: html

   <td>

nsabovic

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   <tr>

.. raw:: html

   <td>

ScionOfBytes

.. raw:: html

   </td>

.. raw:: html

   <td>

simon-scherzinger

.. raw:: html

   </td>

.. raw:: html

   <td>

axelhzf

.. raw:: html

   </td>

.. raw:: html

   <td>

benkroeger

.. raw:: html

   </td>

.. raw:: html

   <td>

fgheorghe

.. raw:: html

   </td>

.. raw:: html

   <td>

IvanVergiliev

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   <tr>

.. raw:: html

   <td>

jpwilliams

.. raw:: html

   </td>

.. raw:: html

   <td>

jaylynch

.. raw:: html

   </td>

.. raw:: html

   <td>

jberrisch

.. raw:: html

   </td>

.. raw:: html

   <td>

kgoerlitz

.. raw:: html

   </td>

.. raw:: html

   <td>

bertho-zero

.. raw:: html

   </td>

.. raw:: html

   <td>

leonardovillela

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   <tr>

.. raw:: html

   <td>

nitzan-shaked

.. raw:: html

   </td>

.. raw:: html

   <td>

robertrossmann

.. raw:: html

   </td>

.. raw:: html

   <td>

roncli

.. raw:: html

   </td>

.. raw:: html

   <td>

superoven

.. raw:: html

   </td>

.. raw:: html

   <td>

wmertens

.. raw:: html

   </td>

.. raw:: html

   <td>

XadillaX

.. raw:: html

   </td>

.. raw:: html

   </tr>

.. raw:: html

   </table>

License
-------

May be freely distributed under the `MIT
license <https://raw.githubusercontent.com/lorenwest/node-config/master/LICENSE>`_.

Copyright (c) 2010-2018 Loren West `and other
contributors <https://github.com/lorenwest/node-config/graphs/contributors>`_

.. |NPM| image:: https://nodei.co/npm/config.svg?downloads=true&downloadRank=true
   :target: https://nodei.co/npm/config/
.. |Build Status| image:: https://secure.travis-ci.org/lorenwest/node-config.svg?branch=master
   :target: https://travis-ci.org/lorenwest/node-config
