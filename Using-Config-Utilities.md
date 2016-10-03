Node-config comes with a handy set of utilities necessary for implementing node-config.  These utilities are exposed in the ```config.util``` object for use in your own applications.

Below is a list of these utilities, in order of general usefulness - your mileage may vary.

## extendDeep(mergeInto, mergeFrom..., depth)

Extend an object (and any object it contains) with one or more objects (and objects contained in them).

This does not replace deep objects as other extend functions do, 
but dives into them extending individual elements instead.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>mergeInto</td><td>object</td><td>The object to merge into</td></tr>
<tr><td>mergeFrom...</td><td>object</td><td>Any number of objects to merge from</td></tr>
<tr><td>depth</td><td>integer</td><td>An optional depth to prevent recursion.  Default: 20.</td></tr>
<tr><td>(return)</td><td>object</td><td>The altered mergeInto object is returned</td></tr>
</table>

The following example merges the contents of two objects into a new object.

```
var newObject = config.util.extendDeep({}, baseObject, anotherObject);
```

## cloneDeep(copyFrom, depth)

Return a deep copy of the specified object.

This returns a new object with all elements copied from the specified
object.  Deep copies are made of objects and arrays so you can do anything
with the returned object without affecting the input object.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>copyFrom</td><td>object</td><td>The original object to copy from</td></tr>
<tr><td>depth</td><td>integer</td><td>An optional depth to prevent recursion.  Default: 20.</td></tr>
<tr><td>(return)</td><td>object</td><td>A new object with the elements copied from the copyFrom object</td></tr>
</table>

Example:

```
var copy = config.util.cloneDeep(fromObject);
```

## equalsDeep(object1, object2, depth)

Return true if two objects have equal contents.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>object1</td><td>object</td><td>The object to compare from</td></tr>
<tr><td>object2</td><td>object</td><td>The object to compare with</td></tr>
<tr><td>depth</td><td>integer</td><td>An optional depth to prevent recursion.  Default: 20.</td></tr>
<tr><td>(return)</td><td>boolean</td><td><i>true</i> if both objects have equivalent contents</td></tr>
</table>

Example:

```
var customerCopy = config.util.cloneDeep(myCustomer);
var same = config.util.equalsDeep(myCustomer, customerCopy); // <-- true
customerCopy.creditLimit = 7000;
var same = config.util.equalsDeep(myCustomer, customerCopy); // <-- false
```

## diffDeep(object1, object2, depth)

Returns an object containing all elements that differ between two objects.

It works best when object2 originated by deep copying object1, then
changes were made to object2, and you want an object that would give you
the changes made to object1 which resulted in object2.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>object1</td><td>object</td><td>The object to compare from</td></tr>
<tr><td>object2</td><td>object</td><td>The object to compare with</td></tr>
<tr><td>depth</td><td>integer</td><td>An optional depth to prevent recursion.  Default: 20.</td></tr>
<tr><td>(return)</td><td>object</td><td>A differential object, which if extended onto object1 would result in object2.</td></tr>
</table>

## makeImmutable(object, propertyName, propertyValue)

Make a javascript object property immutable (assuring it cannot be changed from the current value).

If the propertyName isn't supplied, all properties of the object are made immutable.

Properties which themselves are objects are called recursively, making sub-objects immutable.

New properties can be added to this (and sub) objects, and those properties will not be immutable unless this method is called after adding the properties.

This operation cannot be undone.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>object</td><td>object</td><td>The object containing the properties to make immutable</td></tr>
<tr><td>propertyName</td><td>string | [string]</td><td>(optional) Property name (or array of names) to make immutable.  If not specified, all properties of the object are made immutable</td></tr>
<tr><td>propertyValue</td><td>mixed</td><td>(optional) Property value to set the property to before making immutable. Retained for backward compatibility, and for use only when propertyName is not an array.</td></tr>
<tr><td>(return)</td><td>object</td><td>The original object, with the newly immutable attributes</td></tr>
</table>

Example:

```
var a = {hello:'world'};
config.util.makeImmutable(a);
a.hello = 'there';
console.log ('Sorry, hello is still ' + a.hello);
```

## makeHidden(object, propertyName, propertyValue)

Make an object property hidden so it doesn't appear when enumerating elements of the object.

The property still exists and can be read from and written to, but it won't show up in 
`for ... in` loops, `Object.keys()`, or `JSON.stringify()` type methods.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>object</td><td>object</td><td>The object containing the property to make hidden</td></tr>
<tr><td>propertyName</td><td>string</td><td>Name of the property to make hidden</td></tr>
<tr><td>propertyValue</td><td>string</td><td>(optional) Set the property to this value</td></tr>
<tr><td>(return)</td><td>object</td><td>The original object, with the newly hidden property</td></tr>
</table>

Example:

```
var a = {hello'"world'};
console.log ('Before hiding: ' + JSON.stringify(a));
config.util.makeHidden(a, 'hello');
console.log ('After hiding: ' + JSON.stringify(a));
console.log ('Hidden, but still there: ' + a.hello);
```

## getEnv(varName)

Get the current value of a config environment variable

This method returns the value of the specified config environment variable,
including any defaults or overrides.

Environment variables that you can inspect include `NODE_ENV`, `CONFIG_DIR`, `NODE_CONFIG`,
`HOSTNAME`, `NODE_APP_INSTANCE`, and others listed in the [environment variables](https://github.com/lorenwest/node-config/wiki/Environment-Variables) wiki page.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>varName</td><td>string</td><td>The environment variable name</td></tr>
<tr><td>(return)</td><td>string</td><td>The value of the environment variable</td></tr>
</table>

Example:

```
console.log('Configuration directory: ' + config.util.getEnv('CONFIG_DIR'));
```

## loadFileConfigs(directory)

Reads the given directory using the same conventions as the main config directory (including environment variable reading, except for `NODE_CONFIG`) and returns an object with the result.

If no directory is given, reads the standard config directory and parses `NODE_CONFIG`.

This is useful for using with submodules, e.g.
```js
import config from 'config'
const ourConfigDir = path.join(__dirname, 'config')
const baseConfig = config.util.loadFileConfigs(ourConfigDir)
config.util.setModuleDefaults('MyModule', baseConfig)
```