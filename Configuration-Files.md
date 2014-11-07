## Config Directory

Node-config reads configuration files in the ```./config``` directory for the running process, typically the application root.  This can be overridden by setting the ```$NODE_CONFIG_DIR``` environment variable to the directory containing your configuration files.

```$NODE_CONFIG_DIR``` can be a full path from your root directory, or a relative path from the process if the value begins with ```./``` or ```../```.

## File Load Order

Files in the config directory are loaded in the following order:

    default.EXT
    default-{instance}.EXT
    {hostname}.EXT
    {hostname}-{instance}.EXT
    {deployment}.EXT
    {deployment}-{instance}.EXT
    {hostname}-{deployment}.EXT
    {hostname}-{deployment}-{instance}.EXT
    local.EXT
    local-{instance}.EXT
    local-{deployment}.EXT
    local-{deployment}-{instance}.EXT  

Where 

* ```EXT``` can be .yml, .yaml, .coffee, .cson, .properties, .json, or .js depending on the format you prefer (see below)
* ```{instance}``` is an optional instance name string for [Multi-Instance Deployments](#multi-instance-deployments)
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

The following file formats are supported, recognized by their file extension.

All ```//``` and ```/* ... */``` style comments are removed before file loading, allowing you to add comments to file formats such as .json that don't natively support comments.

### Javascript Object Notation - .json

Files ending in ```.json``` are parsed in JSON format.  Example:

```
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
```

### Javascript 5 Object Notation - .json5

Files ending in ```.json5``` are parsed in [JSON5](http://json5.org/) format.  Example:

```
{
  // Customter module configs
  Customer: {
    dbConfig: {
      host: "localhost",
      port: 5984,
      dbName: "customers",
    },
    credit: {
      initialLimit: 100,
      // Set low for development
      initialDays: 1 
    }
  }
}
```

The .json5 parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```json5``` module in order to read and parse .json5 files.

### Yet another markup language - .yaml

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

The `dependencies` section of your application's `package.json` file must contain the yaml parser, and `js-yaml` is the suggested parser.

### JavaScript module - .js

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
    get dbString() {
      return '' + this.dbName + ':' + this.dbPort;
    },
 
    // Load credit configs externally
    credit: JSON.parse(fs.loadFileSync('./currentCreditPolicy.json'))
  },

  get customerDbName() {
    return '' + this.Customer.dbName;
  }

} 
```

The use of [ECMAScript 5
getters](http://javascriptplayground.com/blog/2013/12/es5-getters-setters/ is
shown in the example.  They have a couple benefits for configuration. First,
they allow the value of one configuration element to refer to the value of
another. Second, the values are computed dynamically when `get()` is called
rather than statically when they are declared. In the example above,
`customerDbName` references the `dbName` element. But the config file for a
specific instance is likely to override this value. Calling `getDbNAME` on the
customer's configuration will refer to the customers `dbName` value, not the
default one.

In the example above, also note now `this` refers to different contexts. In `dbString()` it refers to `config.Customer` and in `customerDbName` it refers to the outer `config` object. The reality is that it refers to whatever object you call the method on. In the above example, this would work as expected:

    // Call get() on the Customer object
    config.Customer.get('dbString')

But this would would not:

    // Call get() on the main config object.
    config.get('Customer.dbString')

To avoid confusion you can always call `get()` on the top level `config` object in your code, and always expect `this` to refer 
the main config object in the getters in your config files.


### CoffeeScript module - .coffee

You know what you like.  Files ending in ```.coffee``` are loaded and run as a CoffeeScript module.  Example CoffeeScript configuration file:

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

CoffeeScript is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain coffee-script in order to read CoffeeScript configuration files.

### CoffeeScript Object Notation - .cson

Files ending in ```.cson``` are loaded and parsed in CoffeeScript object notation, because you can never have enough file formats.  Example CSON configuration file:

```
{
  #comment
  Customers: {
    dbName: 'customers'
    dbPassword: 'pw1'
    lang: [
      'en'
      'es'
    ]
  },
  AnotherModule: {
    parm4: "value4"
  },
  staticArray: [
    2
    1
    3
  ]
}
```

CSON is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```cson``` module in order to read CoffeeScript object notation configuration files.


### Properties file format - .properties

Files ending in ```.properties``` are loaded and parsed in properties file notation, a dot-style name spacing style popular in many non-javascript utilities.  Example .properties configuration file:

```
# Comment
Customer.dbConfig.host = localhost
Customer.dbConfig.port = 5984
```
Every configuration would end up being a string, but that's not particularly troublesome in javascript.

The .properties parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```properties``` module in order to read and parse .properties files.