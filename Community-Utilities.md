### CEV - Custom Environment Variable Generator

If you use [custom environment variables](https://github.com/lorenwest/node-config/wiki/Environment-Variables#custom-environment-variables) a lot, here's a generator for them http://www.scispike.com/blog/get-rid-of-node-js-config-grunt-work/

### config-uncached

Sometimes for testing or DevOps, you need one script to load more than configuration. This is normally a challenge with `node-config` As a singleton, it returns the same configuration each time. To force node-config to reload the configuration, use the [`config-uncached`](https://www.npmjs.com/package/config-uncached) module.