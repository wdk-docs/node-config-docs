Sub Module Configuration
========================================================================================

Are you the author of a NodeJS `NPM module <http://npmjs.org>`_ that
accepts initialization parameters?

If so, and you’re following a pattern like this for your module
configuration:

::

   var initParams = {
     param1: "value1",
     param2: 22
   }
   var MyModule = require('my-module');
   var myModule = new MyModule(initParams);

Or this:

::

   MyModule.setDefaults(initParams)

Then read on.

By following a common pattern, you give developers using your module:

-  A consistent interface for :doc:`Configuration-Files`
   your configurations
-  A way to pass configurations via :doc:`Environment-Variables`
-  A way to pass configurations via :doc:`Command-Line-Overrides`
-  `Other features <https://github.com/lorenwest/node-config/wiki>`_
   built in to node-config

Without breaking existing usage of your module, and without requiring
node-config in their own app (unless they want).

Here’s how it works:

Load node-config at the top of your module like normal, and specify the
:doc:`Environment-Variables`
so applications don’t get *No config files* warnings if they aren’t
using node-config.

::

   process.env.SUPPRESS_NO_CONFIG_WARNING = 'y';
   var config = require('config');

Then do something like this where your configurations are passed in by
the app:

::

   function myModuleConstructor(configs) {

     var myDefaultConfigs = {
       param1: "value1",
       param2: 22
     };

     // Mixin configs that have been passed in, and make those my defaults
     config.util.extendDeep(myDefaultConfigs, configs);
     config.util.setModuleDefaults('MyModule', myDefaultConfigs);
   }

Then use the config object as usual to access configurations within your
module:

::

   console.log('My module config param1: ' + config.get('MyModule.param1'));

This pattern gives apps using your module the choice of using
node-config mechanisms for configuration, or using your existing methods
(as shown at the top of this page).

For example, they can put your module configurations next to their other
configurations and extend configs based on deployment type:

::

   default.json:

   {
     ...
     "MyModule": {
       "param1": "Some value"
     },
     ...
   }

This is an easy way to add new configuration functionality to your NPM
module, while staying compatible with existing usage.

It unifies your module configuration with apps choosing to use
node-config, and stays out of the way for apps using other configuration
systems.
