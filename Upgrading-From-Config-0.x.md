## Incompatible Changes

Version 1.0 is a major revision release - a nice way of saying it may break something relying on a prior version.  There are two incompatible changes - one fairly large and one you probably won't notice.

### Immutable Configurations

Changing configurations after the first ```require('config');``` is no longer supported.  It was the feature causing the most confusion, support, code complexity, and frankly - what were we thinking?

If you relied on the ability to alter configurations at runtime, you will have to replace that with a different implementation, or continue using the 0.4.x release branch.

This is the most significant compatibility change, and it came only after serious consideration and community input.  

And to take it one step further, configs are made immutable so attempts to change config values will fail. Elements can be added to existing objects, but loaded configurations cannot change.

### Load Ordering

Load ordering has been changed from ```hostname.EXT --> deployment.EXT``` to ```deployment.EXT --> hostname.EXT``` because deployments can be on multiple machines, and are a *higher level* than host configurations, which by definition are only applicable to a single host.

This is unlikely to affect anyone, because it didn't make sense to have deployment level configs overwriting host level configs, but it's something to be aware of.

## New Features

### config.get() and config.has()

The top level config object and all sub-objects have a ```get()``` function exposed as the preferred method of accessing configuration values.  This gives you the option of doing this:
```
var config = require('config');
var customerDbHost = config.Customer.dbConfig.host;
```
which is like prior versions that perform no validation, or this:
```
var customerDbHost = config.get('Customer').get('dbConfig').get('host');
```
which throws an exception on typos but is kind of wordy, or this:
```
var customerDbHost = config.get('Customer.dbConfig.host');
```
win.

Using ```get()``` is the preferred method because it fails fast if you misspell a parameter or if the configs weren't loaded for some reason.

If you want to test if a configuration without wrapping in a try/catch, ```has()``` is available at all config levels:
```
if (config.has('Customer.dbConfig')) { 
   ...
}
```