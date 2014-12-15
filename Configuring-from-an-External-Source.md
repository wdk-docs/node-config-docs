In a nutshell: define only external source connection settings in files, using those settings to connect to the source. Once connected, read additional configurations and add them to the config object returned from `require('config');`.

Make sure any external overrides are done in the application bootstrap - before anyone calls the first ```config.get();```, because the config object is made immutable as soon as any client uses the values via `get()`.
