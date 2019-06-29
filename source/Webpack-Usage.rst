Webpack Usage
========================================================================================

Right now ``node-config`` doesn’t work with
`webpack <https://github.com/webpack/webpack>`_ out of the box because
it reads the config files at runtime, which can’t be done when the code
is running on a browser.

Option 1
-----------------------

If you’re using Webpack 4, it includes excellent handling for complex
config objects with ``DefinePlugin`` (as of 2018-05-07). Add the
following to your ``webpack.config.js``:

.. code:: javascript

   ...
   plugins: [
       new webpack.DefinePlugin({ CONFIG: JSON.stringify(require("config")) })
   ]

You can access all fields, including nested fields, under the ``CONFIG``
object in your client-side scripts, without exposing your entire config
object. Note that you won’t have access to ``get()``.

This approach *does* work in Webpack 3, but it inserts your *entire*
config object wherever it is referenced. This is not recommended.

Option 2
-----------------------

Install the
`node-config-webpack <https://github.com/arthanzel/node-config-webpack>`_
package and put the following in ``webpack.config.js``:

.. code:: javascript

   const ConfigWebpackPlugin = require("config-webpack");
   ...
   plugins: [
       new ConfigWebpackPlugin()
   ]

This allows you to access your configuration on the client in the global
namespace ``CONFIG``.

.. code:: javascript

   console.log(CONFIG.server.url)

You can also change the default namespace from ``CONFIG`` to something
else.

.. code:: javascript

   new ConfigWebpackPlugin("myConfigObject")

This method performs direct text replacement of config variables in your
code with their values, and it doesn’t expose any configs that aren’t
used.

Option 3
-----------------------

Below is an example of how you can use ``NODE_ENV`` at build time to
have a static config built into your webpack bundle.

.. important::
   This will publish your entire config file into your front end
   application. If you have sensitive information you do not want
   downloaded, see the notes after the example.

.. code:: javascript

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

Both server and client now can happily use
``import config from 'config'``.

If you have things in the config that you do not want to publish to the
front end, you may consider making a specific ``client`` section of the
config, and only publishing that key to the static json file,
e.g. \ ``import { client } from 'config';``

Alternatively you could use
`lodash <https://github.com/lodash/lodash>`_ ``pick`` or ``omit`` to
control what data is written to the file.

Option 4
-----------------------

Another solution is to take advantage of the :ref:`Environment-Variables-node_config`
with ``webpack.DefinePlugin``. With this method you **CAN** still use ``get()``.

.. code:: js

   const config = require('config');

   const webpackConfig = {
     //webpack plugins config
     plugins: [
       new webpack.DefinePlugin({
         //double stringify because node-config expects this to be a string
         'process.env.NODE_CONFIG': JSON.stringify(JSON.stringify(config)),
       }),
     ],
   };
