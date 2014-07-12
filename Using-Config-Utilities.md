Node-config comes with a handy set of utilities necessary for implementing node-config.  These utilities are exposed in the ```config.util``` object for use in your own applications.

Below is a list of these utilities, in order of general usefulness - your mileage may vary.

### getEnv(varName)

Get the current value of a config environment variable

This method returns the value of the specified config environment variable,
including any defaults or overrides.

Environment variables that you can inspect include ```NODE_ENV```, ```CONFIG_DIR```, ```NODE_CONFIG```,
```HOSTNAME```, and ```NODE_APP_INSTANCE```.  More information about these are in the [environment variables](https://github.com/lorenwest/node-config/wiki/Environment-Variables) wiki page.

<table>
<tr><th>param</th><th>type</th><th>description</th></tr>
<tr><td>varName</td><td>string</td><td>The environment variable name</td></tr>
<tr><td>(return)</td><td>string</td><td>The value of the environment variable</td></tr>
</table>

Example:

```
console.log('Configuration directory: ' + config.getEnv('CONFIG_DIR'));
```

### cloneDeep(copyFrom, depth)

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

### equalsDeep(object1, object2, depth)

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
customerCopy.creditLimit = 29238;
var same = config.util.equalsDeep(myCustomer, customerCopy); // <-- false
```

### diffDeep(object1, object2, depth)

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

 