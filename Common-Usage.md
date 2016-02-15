## Create Configuration files

Create your [[configuration files|Configuration-Files]].

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
This gives you a fail-fast system if (when?) someone screws up your configuration files - it's more common than you'd think. 

If a configuration file does not contain a value for a given property, ```get()``` will throw an exception. Note that ```null``` is an _acceptable_ value, and will not throw an exception when it would be returned by ```get()```. Get will also throw an exception if the parameter passed in to get is ```null``` or ```undefined```.

Additionally, setting config values explicitly to ```undefined``` is a helpful way to ensure that they must be defined by a later configuration file.

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
This can be done as an alternative to wrapping your ```get()``` around a try/catch block. ```has()``` will not throw exceptions, and will return true if and only if the configuration file has a defined value for the provided key. Note that ```null``` is a defined value.

```has()``` will not throw an exception if the parameter passed is ```null``` or ```undefined``` but will simply return ```false```.


