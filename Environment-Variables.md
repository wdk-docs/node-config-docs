## O/S Environment

Environment variables are usually exported in your shell before loading your app.  

The following example sets the ```NODE_ENV``` variable to ```stage```:
```
cd /my/application
export NODE_ENV=stage
node myapp.js
```

You can also set environment variables in your application bootstrap, as long as they're set before the first load of node-config.  This example sets a custom configuration directory:
```
process.env.CONFIG_DIR = process.cwd() + '../allAppConfigs/myAppName';
var config = require('config');
```

The following environment variables are understood by node-config:

### NODE_ENV

This variable contains the name of your application's deployment environment, representing the ```{deployment}``` when determining config [file loading order](https://github.com/lorenwest/node-config/wiki/Configuration-Files#file-load-order).  Common values include ```dev```, ```stage```, ```production-east```, etc. to fit your deployment strategy.

### CONFIG_DIR

This contains the path to the directory containing your [configuration files](https://github.com/lorenwest/node-config/wiki/Configuration-Files).  It can be a direct path from the root, or a relative path if it begins with ```./``` or ```../```.  The default ```CONFIG_DIR``` is the ```/config``` directory under the *current working directory*, usually your application root - the value returned by ```process.cwd() + '/config'```.

The current value of ```CONFIG_DIR``` is available in ```config.util.getEnv()```:
```
var config = require('config');
console.log('CONFIG_DIR: ' + config.util.getEnv('CONFIG_DIR'));
```