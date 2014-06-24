## Major Revision

Version 1.0 is a major revision release - a nice way of saying it may break something relying on a prior version.  There is one fairly large difference, and a few you probably won't notice.

### Immutable Configurations

Changing configurations after the first ```require('config');``` is not supported as of 1.0.  It was the feature causing the most confusion, support, code complexity, and frankly - what were we thinking?

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
which does no validation, or this:
```
var config = require('config');
var customerDbHost = config.get('Customer').get('dbConfig').get('host);
```
which throws an exception on typos but is hard to use, or this:
```
var config = require('config');
var customerDbHost = config.get('Customer.dbConfig.host');
```
win.  

Using ```get()``` is the preferred method because it fails fast if you mis-spell a configuration or if a configuration wasn't loaded for some reason.
