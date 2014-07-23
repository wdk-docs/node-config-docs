Are you the author of a NodeJS [NPM module](http://npmjs.org) that accepts initialization parameters?

If so, and you're following a pattern like this for your module configuration:
```
var initParams = {
  param1: "value1",
  param2: 22
}
var MyModule = require('my-module');
var myModule = new MyModule(initParams);
```

Or this:
```
MyModule.setDefaults(initParams)
```

Then read on.  

By following a common pattern, you give developers using your module:

* A consistent interface for [defining and extending](https://github.com/lorenwest/node-config/wiki/Configuration-Files) your configurations
* A way to pass configurations via [O/S environment variables](https://github.com/lorenwest/node-config/wiki/Environment-Variables)
* A way to pass configurations via [command line arguments](https://github.com/lorenwest/node-config/wiki/Command-Line-Overrides)
* [Other features](https://github.com/lorenwest/node-config/wiki) built in to node-config

Without breaking existing usage of your module, and without requiring node-config in their own app (unless they want).

Here's how it works: 

At the top of your module, load node-config telling it to suppress the warnings that it can't find any configuration files.  This is for applications that aren't using node-config.

```
process.env.SUPPRESS_NO_CONFIG_WARNING = 'y';
var config = require('config');
```

In the place within your module that sets configurations, do something like this:

```
function myModuleConstructor(configs) {

  var myDefaultConfigs = {
    param1: "value1",
    param2: 22
  };

  // Mixin configs that have been passed in, and make those my defaults
  config.util.extendDeep(myDefaultConfigs, configs);
  config.util.setModuleDefaults('MyModule', myConfigDefaults);
}
```

Then use the config object as usual to access configurations within your module:

```
console.log('My module config param1: ' + config.get('MyModule.param1'));
```

This pattern gives apps using your module the choice of using node-config mechanisms for configuration, or using your existing methods (as shown at the top of this page).

For example if they choose to configure using node-config file based configurations:

```
default.json:

{
  ...
  "MyModule": {
    "param1": "Some value"
  },
  ...
}
```



 
