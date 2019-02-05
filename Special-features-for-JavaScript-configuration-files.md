Files ending in ```.js``` are loaded and run as a JavaScript module.  The module must export the configuration object. Some folks appreciate the ability to compute configurations, others feel it's not the right thing to do.  It's nice to live in a world with choice.  

JavaScript modules support the ability to have "deferred" and "raw" values.

## Deferred values in JavaScript configuration files 

In the JavaScript modules you have the option to define a configuration value as a function whose resolution
will be deferred until the final merged configuration structure is built.

For example, you set up a default value for a "full name" that is calculated from "first name" and "last name" values which will be provided a config file which overrides the defaults. 


Example:

```javascript
// In default.js
// using defer functions is optional. See example and docs below.
var defer = require('config/defer').deferConfig;

module.exports = {
  firstName : undefined,
  lastname: undefined,
  fullName : defer(function ()  {
    return this.firstName+' '+this.lastName;
  })
} 
```

Then in `config/production.js`:

```
module.exports = {
   firstName : "Jane",
   lastName: "Doe",
}
```

Because the resolution of `fullName` is deferred, it would resolve to refer to the overridden first and last name.

The use of [ECMAScript 5 getters](http://javascriptplayground.com/blog/2013/12/es5-getters-setters/) in JavaScript configurations is not supported.  Using deferred configuration values is the recommended alternative.

## Using promises, process.stdout and other objects in JavaScript config files

There may be instances where you would like to place a complex object like `process.stdout` into your configuration file, e.g. logging configuration. But node-config achieves its useful functionality by modifying the config object prototypes then making them immutable - not ideal for `process.stdout`! But you can still achieve the goal by using the `raw` functionality like so:
```javascript
const raw = require('config/raw').raw;

module.exports = {
  logOutputStream: raw(process.stdout)
};
```

Promises or other objects can be included in JavaScript files using the same method.

## Including other files

If you'd like to include values from another file in JavaScript, no special syntax is required--the full features of Node.js are already available!

```
config = {
      // Load credit configs externally
    credit: JSON.parse(fs.readFileSync('./currentCreditPolicy.json'))
}