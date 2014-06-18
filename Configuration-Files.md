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
* ```{hostname}``` is your server name, from the ```$HOSTNAME``` environment variable or ```os.hostname()```
* ```{deployment}``` is the deployment name, from the ```$NODE_ENV``` environment variable



runtime.json


## File Formats

NOTE: If you use .yml, .yaml, or .coffee file extensions, the 'yaml' or 'coffee-script' modules must be available. These external dependencies are not included from this package.
Configuration files can be in JavaScript format, JSON format, COFFEE format, or YAML format - whichever you prefer.


### Heading 2

hostname is the $HOST environment variable if set, otherwise the $HOSTNAME environment variable if set, otherwise the hostname found from require('os').hostname(). Once a hostname is found, everything from the first period ('.') onwards is removed. For example, abc.example.com becomes abc
deployment is the deployment type, found in the $NODE_ENV environment variable. Defaults to 'development'.
The runtime.json file contains configuration changes made at runtime either manually, or by the application setting a configuration value. The location is specified by NODE_CONFIG_RUNTIME_JSON environment variable. By default, it is a file called runtime.json in NODE_CONFIG_DIR directory. Node-config monitors this file and loads any new configurations it detects. This file is loaded after all other configurations, including the $NODE_CONFIG environment variable and --NODE_CONFIG command line parameter (see below).