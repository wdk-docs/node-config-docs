Node-config comes with a handy set of utilities necessary for implementing node-config.  These utilities are exposed in the ```config.util``` object for use in your own applications.

Below is a list of these utilities, in order of general usefulness - your mileage may vary.

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