Node-config uses a handful of environment variables for its own configuration. It can also use [custom environment variables](#custom-environment-variables) to override your app's configuration. In both cases, these are generally exported in your shell before loading the app, but can also be supplied on the command line or in your app bootstrap.

Example exporting to the O/S before loading your app:
```
cd /my/application
export NODE_ENV=stage
node myapp.js
```

Example passing on the command line:
```
cd /my/application
NODE_ENV=stage node myapp.js 
```

Example setting in JavaScript before the first load of node-config:
```
process.env.NODE_ENV = "stage";
var config = require('config');
```

## NODE_ENV

This variable contains the name of your application's deployment environment, representing the ```{deployment}``` when determining config [file loading order](https://github.com/lorenwest/node-config/wiki/Configuration-Files#file-load-order).  Common values include ```dev```, ```stage```, ```production-east```, etc. to fit your deployment strategy.

The current value of ```NODE_ENV``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('NODE_ENV: ' + config.util.getEnv('NODE_ENV'));
```

## NODE_CONFIG_DIR

This contains the path to the directory containing your [configuration files](https://github.com/lorenwest/node-config/wiki/Configuration-Files).  It can be a direct path from the root, or a relative path if it begins with ```./``` or ```../```.  The default ```NODE_CONFIG_DIR``` is the ```/config``` directory under the *current working directory*, usually your application root - the value returned by ```process.cwd() + '/config'```.

The current value of ```NODE_CONFIG_DIR``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('NODE_CONFIG_DIR: ' + config.util.getEnv('NODE_CONFIG_DIR'));
```

## NODE_CONFIG

This allows you to override any configuration from the command line or shell environment.  The ```NODE_CONFIG``` environment variable must be a JSON formatted string.  Any configurations contained in this will override the configurations found and merged from the config files.

If ```NODE_CONFIG``` is supplied both from the O/S environment _and_ the command line, they'll both be used with command line values favored over O/S environment values.  

Example:

```
$ export NODE_CONFIG='{"Customer":{"dbConfig":{"host":"customerdb.prod"}}}'
$ node myapp.js
```

The current value of ```NODE_CONFIG```, mixed from the O/S environment and command line is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('NODE_CONFIG: ' + config.util.getEnv('NODE_CONFIG'));
```

## HOSTNAME (or HOST)

This variable contains the name of your host server, representing the ```{hostname}``` when determining config [file loading order](https://github.com/lorenwest/node-config/wiki/Configuration-Files#file-load-order). 

Sometimes the default hostname returned by ```os.hostname()``` isn't what you expect, and setting this before running your app makes sure you've got the right name.

For backward compatibility, if the **HOST** variable is set, that value is used instead.

Regardless of the variable or default used, the current value of ```HOSTNAME``` is available in ```config.util.getEnv()```:

```
var config = require('config');
console.log('HOSTNAME: ' + config.util.getEnv('HOSTNAME'));
```

## NODE_APP_INSTANCE

As described in the [multi instance deployment](https://github.com/lorenwest/node-config/wiki/Multiple-Node-Instances) section, if you're running multiple instances of your app and need different configurations for each instance, this enables loading of instance specific config files.

The current value of ```NODE_APP_INSTANCE``` is available in ```config.util.getEnv()```

```
var config = require('config');
console.log('NODE_APP_INSTANCE: ' + config.util.getEnv('NODE_APP_INSTANCE'));
```

## ALLOW_CONFIG_MUTATIONS

If this environment variable contains anything, then mutations of the configuration object are allowed.  This is for edge cases such as testing, where it is important to mutate configurations for different scenarios within the same execution.

The safety afforded by making the configuration object immutable is lost when this environment variable is used.

The current value of ```ALLOW_CONFIG_MUTATIONS``` is available in ```config.util.getEnv()```

```
var config = require('config');
console.log('ALLOW_CONFIG_MUTATIONS: ' + config.util.getEnv('ALLOW_CONFIG_MUTATIONS'));
```

## SUPPRESS_NO_CONFIG_WARNING

If this environment variable contains anything, then the following message
```
WARNING: No configurations found in configuration directory
```
will be suppressed if no configurations were found when loading node-config.  This is important for NPM modules using node-config to allow apps using these sub-modules the option of using node-config if they choose, or a different configuration system without getting annoying warning messages.

See the article on [sub module configuration](https://github.com/lorenwest/node-config/wiki/Sub-Module-Configuration) for more information about using node-config in an NPM module.

The current value of ```SUPPRESS_NO_CONFIG_WARNING``` is available in ```config.util.getEnv()```

```
var config = require('config');
console.log('SUPPRESS_NO_CONFIG_WARNING: ' + config.util.getEnv('SUPPRESS_NO_CONFIG_WARNING'));
```

# Custom Environment Variables

(New as of 1.1.0) Some deployment situations rely heavily on environment variables to configure secrets and settings best left out of a codebase. [NODE_CONFIG](#node_config) lets you use a JSON string to deal with this, but sometimes simpler, flatter environment variables are better suited.

To enable custom environment variables, create a configuration file, `custom-environment-variables.json` (or `.yaml` or `.js`) mapping the environment variable names into your configuration structure. For example:

```
{
  "Customer": {
    "dbConfig": {
      "host": "PROD_SERVER"
    },
    "credit": {
      "initialDays": "CR_ID"
    }
  }
}
```

...would cause `node-config` to check for the environment variables `PROD_SERVER` and `CR_ID`. If they exist, they would override the values for `Customer.dbConfig.host`, and `Customer.credit.initialDays` in your configuration. Empty environment variables are ignored, and their mappings have no effect on your config.

**Precedence**: Custom environment variables override all configuration files, including `local.json`. Only command line options take precedence over them.

