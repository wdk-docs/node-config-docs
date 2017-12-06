Right now `node-config` doesn't work with [webpack](https://github.com/webpack/webpack) out of the box because it operates at runtime.

# Option 1
Below is an example of how you can use `NODE_ENV` at build time to have a static config built into your webpack bundle.

**IMPORTANT NOTE**  
This will publish your entire config file into your front end application. If you have sensitive information you do not want downloaded, see the notes after the example.

```javascript
// webpack-config.js
const config = require('config')
const fs = require('fs')
const path = require('path');

// This will take the config based on the current NODE_ENV and save it to 'build/client.json'
// Note: If '/build' does not exist, this command will error; alternatively, write to '/config'.
// The webpack alias below will then build that file into the client build.
fs.writeFileSync(path.resolve(__dirname, 'build/client.json'), JSON.stringify(config))

module.exports = {
  // ... other webpack config
  resolve: {
    alias: {
      config: path.resolve(__dirname, 'build/client.json')
    }
  }
}
```

Both server and client now can happily use `import config from 'config'`.

If you have things in the config that you do not want to publish to the front end, you may consider making a specific `client` section of the config, and only publishing that key to the static json file, e.g. `import { client } from 'config';`

Alternatively you could use [lodash](https://github.com/lodash/lodash) `pick` or `omit` to control what data is written to the file.

# Option 2 - Without the `fs` side effect:
Another solution that avoids the `fs` side effect is as follows. Create a file with the following:
```
import config from 'config';
const configJson = JSON.stringify(config);
module.exports = {
    ...configJson,
}
```
> note because we stringify the config at runtime we loose `node-config` methods such as `get()`.

I have put this in my `/config` directory.
In webpack I then do this:
```
resolve: {
    alias: {
        config: path.join(__dirname, '../config/config_webpack.js')
    },
},
```

Finally in the client-side, config is available. e.g.
```
import { NODE_ENV, DEFAULT_LANGUAGE } from 'config';
```

