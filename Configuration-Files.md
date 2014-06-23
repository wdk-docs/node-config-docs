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

## File Formats

### Comments

All ```//``` or ```/* ... */``` style comments are removed before file loading, allowing you to add comments to file formats such as .json that don't natively support comments.

### JSON

Files ending in ```.json``` are parsed in JSON format.  As a native format, no additional libraries are needed to use JSON.  Example:

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

Files ending in ```.js``` are loaded and run as JavaScript modules.  The modules must export the configuration object.  Some folks appreciate the ability to compute configurations, others feel it's not the right thing to do.  Isn't it nice to live in a world with choice?  Example:

```
var fs = require('fs');
module.export = {
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
```


### Coffee

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

Files ending in ```.yaml``` or ```.yml``` are parsed in YAML format.  Node-config doesn't include a YAML library, and beware there are some good ones and some not-so-good ones out there.  If no global ```Yaml``` variable is available, node-config will attempt to load a good one ([js-yaml](https://github.com/nodeca/js-yaml)).  Example:


NOTE: If you use .yml, .yaml, or .coffee file extensions, the 'yaml' or 'coffee-script' modules must be available. These external dependencies are not included from this package.
Configuration files can be in JavaScript format, JSON format, COFFEE format, or YAML format - whichever you prefer.


### Heading 2

hostname is the $HOST environment variable if set, otherwise the $HOSTNAME environment variable if set, otherwise the hostname found from require('os').hostname(). Once a hostname is found, everything from the first period ('.') onwards is removed. For example, abc.example.com becomes abc
deployment is the deployment type, found in the $NODE_ENV environment variable. Defaults to 'development'.
The runtime.json file contains configuration changes made at runtime either manually, or by the application setting a configuration value. The location is specified by NODE_CONFIG_RUNTIME_JSON environment variable. By default, it is a file called runtime.json in NODE_CONFIG_DIR directory. Node-config monitors this file and loads any new configurations it detects. This file is loaded after all other configurations, including the $NODE_CONFIG environment variable and --NODE_CONFIG command line parameter (see below).