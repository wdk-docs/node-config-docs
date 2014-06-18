# Configuration Files

Node-config reads configuration files in the ```config``` directory under the process current working directory.  The directory containing config files can be overridden by the $NODE_CONFIG_DIR environment variable.

Configuration files can be in JavaScript format, JSON format, COFFEE format, or YAML format - whichever you prefer.

Configuration files in the config directory are loaded in the following order:

    default.EXT
    hostname.EXT
    deployment.EXT
    hostname-deployment.EXT
    local.EXT
    local-deployment.EXT
    runtime.json
  
Where EXT can be .yml, .yaml, .coffee, .json, or .js depending on the format you prefer. 

NOTE: If you use .yml, .yaml, or .coffee file extensions, the 'yaml' or 'coffee-script' modules must be available. These external dependencies are not included from this package.

hostname is the $HOST environment variable if set, otherwise the $HOSTNAME environment variable if set, otherwise the hostname found from require('os').hostname(). Once a hostname is found, everything from the first period ('.') onwards is removed. For example, abc.example.com becomes abc
deployment is the deployment type, found in the $NODE_ENV environment variable. Defaults to 'development'.
The runtime.json file contains configuration changes made at runtime either manually, or by the application setting a configuration value. The location is specified by NODE_CONFIG_RUNTIME_JSON environment variable. By default, it is a file called runtime.json in NODE_CONFIG_DIR directory. Node-config monitors this file and loads any new configurations it detects. This file is loaded after all other configurations, including the $NODE_CONFIG environment variable and --NODE_CONFIG command line parameter (see below).