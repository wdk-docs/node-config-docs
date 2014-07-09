Node-config uses a handful of environment variables for it's own configuration.  These are generally exported in your shell before loading the app, but can also be supplied on the command line or in your app bootstrap.

Example exporting to the O/S before loading your app:
```
cd /my/application
export NODE_ENV=stage
node myapp.js
```

Example passing on the command line:
```
cd /my/application
node myapp.js --NODE_ENV=stage
```

Example setting in JavaScript before the first load of node-config:
```
process.env.NODE_ENV = "stage";
var config = require('config');
```

### NODE_ENV

This variable contains the name of your application's deployment environment, representing the ```{deployment}``` when determining config [file loading order](https://github.com/lorenwest/node-config/wiki/Configuration-Files#file-load-order).  Common values include ```dev```, ```stage```, ```production-east```, etc. to fit your deployment strategy.

The current value of ```NODE_ENV``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('NODE_ENV: ' + config.util.getEnv('NODE_ENV'));
```

### CONFIG_DIR

This contains the path to the directory containing your [configuration files](https://github.com/lorenwest/node-config/wiki/Configuration-Files).  It can be a direct path from the root, or a relative path if it begins with ```./``` or ```../```.  The default ```CONFIG_DIR``` is the ```/config``` directory under the *current working directory*, usually your application root - the value returned by ```process.cwd() + '/config'```.

The current value of ```CONFIG_DIR``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('CONFIG_DIR: ' + config.util.getEnv('CONFIG_DIR'));
```

### NODE_CONFIG

This allows you to override any configuration via the command line or environment.  The ```NODE_CONFIG``` environment variable must be a JSON string.  Any configuration contained in this will override the configuration found and merged from config files.

If ```NODE_CONFIG``` is supplied both from the O/S environment and the command line they will both be used, with the command line value favored over the O/S environment value.

The current value of ```CONFIG_DIR``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('CONFIG_DIR: ' + config.util.getEnv('CONFIG_DIR'));
```