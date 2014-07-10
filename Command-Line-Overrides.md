Configurations can be overridden by specifying ```--NODE_CONFIG='{...}'``` command line parameter when starting your application.

The parameter value must be supplied as a valid JSON string.  The following example overrides the Customer.dbConfig.host configuration:

```
$ node myapp.js --NODE_CONFIG='{"Customer":{"dbConfig":{"host":"customerdb.prod"}}}'
```

The single quotes around the JSON value preserve the double quotes, and you may have to escape special characters, based on your O/S shell.

The ```NODE_CONFIG``` parameter may also be supplied [as a shell environment variable](https://github.com/lorenwest/node-config/wiki/Environment-Variables#node_config);

