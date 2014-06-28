## Config Directory

Node-config reads configuration files in the ```./config``` directory for the running process, typically the application root.  This can be overridden by setting the ```$NODE_CONFIG_DIR``` environment variable to the directory containing your configuration files.

```$NODE_CONFIG_DIR``` can be a full path from your root directory, or a relative path from the process if the value begins with ```./``` or ```../```.

## File Load Order

Files in the config directory are loaded in the following order:

    default.EXT
    {hostname}.EXT
    {deployment}.EXT
    {hostname}-{deployment}.EXT
    local.EXT
    local-{deployment}.EXT
  
Where 

* ```EXT``` can be .yml, .yaml, .coffee, .json, or .js depending on the format you prefer (see below)
* ```{hostname}``` is your server name, from the ```$HOST``` or ```$HOSTNAME``` environment variable or ```os.hostname()``` (in that order)
* ```{deployment}``` is the deployment name, from the ```$NODE_ENV``` environment variable

The ```default.EXT``` file is designed to contain all configuration parameters from which other files may overwrite.  Overwriting is done on a parameter by parameter basis, so subsequent files contain only the parameters unique for that override.

```{hostname}``` and ```{deployment}``` files allow you to tune configurations for a particular server or deployment.  These files are designed to live along with other files in your version control system.

The ```local``` files are intended to *not* be tracked in your version control system.  External configuration management tools can write these files upon application deployment, before application loading.

## Multi Instance Deployments

In order to support different configurations for each application instance running on a machine, the  ```NODE_APP_INSTANCE``` [environment variable](https://github.com/lorenwest/node-config/wiki/Environment-Variables) is inspected, and used for loading instance specific files.

For example, if the ```NODE_APP_INSTANCE=3``` environment variable is set, immediately following the load of ```default.json```, a file by the name of ```default-3.json``` will be loaded if present.

This works for all configuration files, so if your ```NODE_APP_INSTANCE=3``` and ```NODE_ENV=stage```, then immediately after loading ```stage.yaml```, a file by the name of ```stage-3.yaml``` will be loaded if present.

## File Formats

### Comments

All ```//``` or ```/* ... */``` style comments are removed before file loading, allowing you to add comments to file formats such as .json that don't natively support comments.

### JSON

Files ending in ```.json``` are parsed in JSON format.  Example:

```
{
  // Customter module configs
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
```

### YAML

Files ending in ```.yaml``` or ```.yml``` are parsed in YAML format.  Node-config doesn't include a YAML library, and beware there are some good ones and some not-so-good ones out there.  If no global ```Yaml``` variable is available, node-config will attempt to load a good one ([js-yaml](https://github.com/nodeca/js-yaml)).  Example:

```
// Customter module configs
Customer
  dbConfig:
    host: localhost
    port: 5984
    dbName: customers
  credit:
    initialLimit: 100
    // Set low for development
    initialDays: 1 
```

### JavaScript

Files ending in ```.js``` are loaded and run as a JavaScript module.  The module must export the configuration object.  Some folks appreciate the ability to compute configurations, others feel it's not the right thing to do.  It's nice to live in a world with choice.  Example:

```
var fs = require('fs');
module.exports = {
  // Customter module configs
  Customer: {
    dbConfig: {
      host: "localhost",
      port: 5984,
      dbName: "customers"
    },
  
    // Load credit configs externally
    credit: JSON.parse(fs.loadFileSync('./currentCreditPolicy.json'))
  }
} 
```

### CoffeeScript

You know what you like.  Files ending in ```.coffee``` are loaded and run as a CoffeeScript module. CoffeeScript must either be loaded with the global ```Coffee``` variable, or ```require('coffee-script')``` will be run to load it.  Example CoffeeScript configuration file:

```
module.exports = 
  // Customter module configs
  Customer:
    dbConfig:
      host: "localhost"
      port: 5984
      dbName: "customers"
    credit:
      initialLimit: 100
      // Set low for development
      initialDays: 1 
```
