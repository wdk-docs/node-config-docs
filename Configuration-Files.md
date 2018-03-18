## Config Directory

Node-config reads configuration files in the ```./config``` directory for the running process, typically the application root.  This can be overridden by setting the ```$NODE_CONFIG_DIR``` environment variable to the directory containing your configuration files. It can also be set from node, before loading Node-config:
```
process.env["NODE_CONFIG_DIR"] = __dirname + "/configDir/";
const config = require("config");
```

```$NODE_CONFIG_DIR``` can be a full path from your root directory, or a relative path from the process if the value begins with ```./``` or ```../```.

## File Load Order

Files in the config directory are loaded in the following order:

    default.EXT
    default-{instance}.EXT
    {deployment}.EXT
    {deployment}-{instance}.EXT
    {short_hostname}.EXT
    {short_hostname}-{instance}.EXT
    {short_hostname}-{deployment}.EXT
    {short_hostname}-{deployment}-{instance}.EXT
    {full_hostname}.EXT
    {full_hostname}-{instance}.EXT
    {full_hostname}-{deployment}.EXT
    {full_hostname}-{deployment}-{instance}.EXT
    local.EXT
    local-{instance}.EXT
    local-{deployment}.EXT
    local-{deployment}-{instance}.EXT
    (Finally, custom environment variables can override all files)

Where 

* ```EXT``` can be .yml, .yaml, .xml, .coffee, .cson, [.properties](https://github.com/gagle/node-properties), [.json](http://json.org/), [.json5](http://json5.org/), [.hjson](http://laktak.github.io/hjson/) or .js depending on the format you prefer (see below)
* ```{instance}``` is an optional instance name string for [Multi-Instance Deployments](#multi-instance-deployments)
* ```{short_hostname}``` is your server name up to the first dot, from the ```$HOST``` or ```$HOSTNAME``` environment variable or ```os.hostname()``` (in that order). For example if your hostname is ```www.example.com``` then it would load ```www.EXT```.
* ```{full_hostname}``` is your whole server name, you may use this when ```{short_hostname}``` collides with other machines.
* ```{deployment}``` is the deployment name, from the ```$NODE_ENV``` (or if specified, ```$NODE_CONFIG_ENV```) environment variable

The ```default.EXT``` file is designed to contain all configuration parameters from which other files may overwrite.  Overwriting is done on a parameter by parameter basis, so subsequent files contain only the parameters unique for that override.

```{hostname}``` and ```{deployment}``` files allow you to tune configurations for a particular server or deployment.  These files are designed to live along with other files in your version control system.

## `local` files

The ```local``` files are intended to *not* be tracked in your version control system.  External configuration management tools can write these files upon application deployment, before application loading.

The best practice for using `local` files is avoid a global `local.EXT` file that would affect all '{deployment}' and '{instance}' cases. Instead, choose the most specific variant of  `local-{instance}.EXT`,
`local-{deployment}.EXT` or `local-{deployment}-{instance}.EXT` that applies. With this design you can avoid a case where tests pass locally due to local overrides but don't pass after you push. Choose a `local` file variant that is not used for your testing context!

## Default NODE_ENV

If `NODE_ENV` is not set in the environment, a default value of `development` is used. 

## Arrays are merged by replacement

Note that arrays are always merged by replacement. That is, the complete contents of an array in an override file will replace the complete array from a parent file.

## Multi Instance Deployments

In order to support different configurations for each application instance running on a machine, the  ```NODE_APP_INSTANCE``` [environment variable](https://github.com/lorenwest/node-config/wiki/Environment-Variables) is inspected, and used for loading instance specific files.

For example, if the ```NODE_APP_INSTANCE=3``` environment variable is set, immediately following the load of ```default.json```, a file by the name of ```default-3.json``` will be loaded if present.

This works for all configuration files, so if your ```NODE_APP_INSTANCE=3``` and ```NODE_ENV=stage```, then immediately after loading ```stage.yaml```, a file by the name of ```stage-3.yaml``` will be loaded if present.

## Environment variables

[Custom environment variables](https://github.com/lorenwest/node-config/wiki/Environment-Variables#custom-environment-variables) override all configuration files, including local.json. Only command line options take precedence over them.

## File Formats

The following file formats are supported, recognized by their file extension.

All ```//``` and ```/* ... */``` style comments are removed before file loading, allowing you to add comments to file formats such as .json that don't natively support comments.

### Javascript Object Notation - .json

Files ending in ```.json``` are parsed in JSON format.  Example:

```json
{
  "Customer": {
    "dbConfig": {
      "host": "localhost",
      "port": 5984,
      "dbName": "customers"
    },
    "credit": {
      "initialLimit": 100,
      "initialDays": 1
    }
  }
}
```

### Javascript 5 Object Notation - .json5

Files ending in ```.json5``` are parsed in [JSON5](http://json5.org/) format.  Example:

```json5
{
  Customer: {
    dbConfig: {
      host: "localhost",
      port: 5984,
      dbName: "customers",
    },
    credit: {
      initialLimit: 100,
      initialDays: 1
    }
  }
}
```

The .json5 parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```json5``` module in order to read and parse .json5 files.

### Human JSON - .hjson

Files ending in ```.hjson``` are parsed in [Hjson](http://laktak.github.io/hjson/) format.  Example:

```hjson
{
  Customer:
  {
    dbConfig:
    {
      host: localhost
      port: 5984
      dbName: customers
    }
    credit:
    {
      initialLimit: 100
      initialDays: 1
    }
  }
}
```

The .hjson parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```hjson``` module in order to read and parse .hjson files.

### Yet another markup language - .yaml

Files ending in ```.yaml``` or ```.yml``` are parsed in YAML format.  Node-config doesn't include a YAML library, and beware there are some good ones and some not-so-good ones out there.  If no global ```Yaml``` variable is available, node-config will attempt to load a good one ([js-yaml](https://github.com/nodeca/js-yaml)).  Example:

```yaml
// Customer module configs
Customer:
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

Files ending in ```.js``` are loaded and run as a JavaScript module.  The module must export the configuration object.  JavaScript modules support the ability to have "deferred" and "raw" values.

See [Special features for JavaScript configuration files](https://github.com/lorenwest/node-config/wiki/Special-features-for-JavaScript-configuration-files) for details. 

### CoffeeScript module - .coffee

You know what you like.  Files ending in ```.coffee``` are loaded and run as a CoffeeScript module.  Example CoffeeScript configuration file:

```coffee
module.exports = 
  # Customer module configs
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

```cson
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
    param4: "value4"
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

```properties
# Comment
Customer.dbConfig.host = localhost
Customer.dbConfig.port = 5984
```
Every configuration would end up being a string, but that's not particularly troublesome in javascript.

The .properties parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```properties``` module in order to read and parse .properties files.

### TOML file format - .toml

Files ending in ```.toml``` are loaded and parsed in TOML (Tom's Obvious, Minimal Language), a new and very simple configuration file format. Example .toml configuration file:

```toml
[database]
host = "localhost"
port = 5984
```
The .toml parser is not a dependency of node-config.  The `dependencies` section of your application's `package.json` file must contain the ```toml``` module in order to read and parse .toml files.

### Extensible Markup Language - .xml

Files ending in ```.xml``` are parsed in XML format. Example:

```xml
// Customer module configs
<config>
  <Customer>
    <dbConfig>
      <host>localhost</host>
      <port>5984</port>
      <dbName>customers</dbName>
    </dbConfig>
    <credit>
      <initialLimit>100</initialLimit>
      <initialDays>1</initialDays>
    </credit>
  </Customer>
</config>
```

The `dependencies` section of your application's `package.json` file must contain x2js in order to read XML configuration files.