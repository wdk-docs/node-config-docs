Asynchronous Configurations
========================================================================================

In the JavaScript modules you have an option to define a configuration
value asynchronously.

Async configuration
-------------------

Using the ``asyncConfig`` utility method you can wrap both promises and
async functions (a function which returns a promise) whose resolution
will be deferred until:

-  the final merged configuration structure is built (that’s when async
   functions are executed; see
   `deferConfig <https://github.com/lorenwest/node-config/wiki/Special-features-for-JavaScript-configuration-files#deferred-values-in-javascript-configuration-files>`_)
-  the ``resolveAsyncConfigs`` utility method has been called and
   resolved (all asynchronous configurations been resolved)

::

   const asyncConfig = require('config/async').asyncConfig;
   const fetchRequest = fetch('/config/services')
     .then(res => res.json());  // Promise example
   async function dbSecrets(config, original) {  // async function example
     const doc = await db.collection('config').findOne({service: 'node'});
     return doc.secretKeys;
   }
   module.exports = {
     mode: 'dev',  // unrelated value
     fromUrl: asyncConfig(fetchRequest),
     fromDatabase: asyncConfig(dbSecrets),
   };

Resolving async configurations
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

**Important!** - Never call ``config.get`` before
``resolveAsyncConfigs``

It will cause the config object to freeze and will make resolving values
impossible.

::

   const { resolveAsyncConfigs } = require('config/async');
   const config = require('config');

   resolveAsyncConfigs(config)
     .then(config => require('./main.js'));

   // OR - equivalent to:

   (async function() {
     await resolveAsyncConfigs(config);
     await import('./main.js');
   })();

**Note**: support of advance syntax will depend on your node version
and/or babel configurations
