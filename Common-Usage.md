## Loading Node-Config

Place this at the top of your javascript file:
```
var config = require('config');
```

Or load a specific configuration context:
```
var config = require('config').get('Customer');
```

## Using Config Values

The preferred method of accessing configurations is through ```get()```:
```
var dbHost = config.get('dbConfig.host');
```
This gives you a fail-fast system if (when?) someone screws up your configuration files.  It's is more common than you'd think.

The alternative is to attain the value directly:
```
var dbHost = config.dbConfig.host;
```
This doesn't give you protection from typos and configuration file problems, but is supported for backward compatibility.

## Testing for config values

If you want to see if a config value exists, use the ```has()``` method
```
if (config.has('dbConfig')) {
  ...
}
```
This can be done as an alternative to wrapping your ```get()``` around a try/catch block.


