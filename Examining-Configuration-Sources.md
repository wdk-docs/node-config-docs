
Configurations are similar to CSS in that they *cascade* from less
specific to more specific.  The `config.util.getConfigSources();` method
can be used to see all sources contributing to the ultimate
configuration, and the order in which they were are applied. 

This would
allow a UI similar to a CSS inspector to show all source values, with
strikethroughs for values overwritten by more specific cascading values.

## Example output of getConfigSources

```javascript
[ { name: '/full/path/to/config/default.js',
    original: '\nvar config = {\n  siteName : \'default site name\',\n};\n\nconfig.email = {\n    subject : \'default subject\',\n}\n\nmodule.exports = config;\n',
    parsed: { siteName: 'default site name', email: [Object] } },
  { name: '/full/path/to/config/local.js',
    original: '\nvar config = {\n  siteName : \'local site name\',\n};\n\nmodule.exports = config;\n',
    parsed: { siteName: 'local site name' } },
  { name: '$NODE_CONFIG', parsed: { EnvOverride: [Object] } },
  { name: '--NODE_CONFIG argument',
    parsed: { EnvOverride: [Object] } } ]
```

Notice that in additon to full paths, some other special names are included: `$NODE_CONFIG` from the environment and `--NODE_CONFIG argument` from the command line.

While `[Object]` is shown here, the full objects are available in the actual output.