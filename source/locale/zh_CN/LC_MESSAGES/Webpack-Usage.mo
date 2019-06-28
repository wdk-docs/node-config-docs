��          �               l     m  �   �  �     y     K   }  �   �  �   �  �   v                      �   (  ^      �   _  �   �  �        )	  �   7	  L    
  �  M
     �  �   �  �   m  y   e  K   �  �   +  �   &  �   �     f     o     x     �  �   �  ^   b  �   �  �   H  �   �     �  �   �  L   b   **IMPORTANT NOTE** Alternatively you could use `lodash <https://github.com/lodash/lodash>`_ ``pick`` or ``omit`` to control what data is written to the file. Another solution is to take advantage of the ```NODE_CONFIG`` environment variable <https://github.com/lorenwest/node-config/wiki/Environment-Variables#node_config>`_ with ``webpack.DefinePlugin``. With this method you **CAN** still use ``get()``. Below is an example of how you can use ``NODE_ENV`` at build time to have a static config built into your webpack bundle. Both server and client now can happily use ``import config from 'config'``. If you have things in the config that you do not want to publish to the front end, you may consider making a specific ``client`` section of the config, and only publishing that key to the static json file, e.g. \ ``import { client } from 'config';`` If you’re using Webpack 4, it includes excellent handling for complex config objects with ``DefinePlugin`` (as of 2018-05-07). Add the following to your ``webpack.config.js``: Install the `node-config-webpack <https://github.com/arthanzel/node-config-webpack>`_ package and put the following in ``webpack.config.js``: Option 1 Option 2 Option 3 Option 4 Right now ``node-config`` doesn’t work with `webpack <https://github.com/webpack/webpack>`_ out of the box because it reads the config files at runtime, which can’t be done when the code is running on a browser. This allows you to access your configuration on the client in the global namespace ``CONFIG``. This approach *does* work in Webpack 3, but it inserts your *entire* config object wherever it is referenced. This is not recommended. This method performs direct text replacement of config variables in your code with their values, and it doesn’t expose any configs that aren’t used. This will publish your entire config file into your front end application. If you have sensitive information you do not want downloaded, see the notes after the example. Webpack Usage You can access all fields, including nested fields, under the ``CONFIG`` object in your client-side scripts, without exposing your entire config object. Note that you won’t have access to ``get()``. You can also change the default namespace from ``CONFIG`` to something else. Project-Id-Version: node-config docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-28 16:27+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **IMPORTANT NOTE** Alternatively you could use `lodash <https://github.com/lodash/lodash>`_ ``pick`` or ``omit`` to control what data is written to the file. Another solution is to take advantage of the ```NODE_CONFIG`` environment variable <https://github.com/lorenwest/node-config/wiki/Environment-Variables#node_config>`_ with ``webpack.DefinePlugin``. With this method you **CAN** still use ``get()``. Below is an example of how you can use ``NODE_ENV`` at build time to have a static config built into your webpack bundle. Both server and client now can happily use ``import config from 'config'``. If you have things in the config that you do not want to publish to the front end, you may consider making a specific ``client`` section of the config, and only publishing that key to the static json file, e.g. \ ``import { client } from 'config';`` If you’re using Webpack 4, it includes excellent handling for complex config objects with ``DefinePlugin`` (as of 2018-05-07). Add the following to your ``webpack.config.js``: Install the `node-config-webpack <https://github.com/arthanzel/node-config-webpack>`_ package and put the following in ``webpack.config.js``: Option 1 Option 2 Option 3 Option 4 Right now ``node-config`` doesn’t work with `webpack <https://github.com/webpack/webpack>`_ out of the box because it reads the config files at runtime, which can’t be done when the code is running on a browser. This allows you to access your configuration on the client in the global namespace ``CONFIG``. This approach *does* work in Webpack 3, but it inserts your *entire* config object wherever it is referenced. This is not recommended. This method performs direct text replacement of config variables in your code with their values, and it doesn’t expose any configs that aren’t used. This will publish your entire config file into your front end application. If you have sensitive information you do not want downloaded, see the notes after the example. Webpack用法 You can access all fields, including nested fields, under the ``CONFIG`` object in your client-side scripts, without exposing your entire config object. Note that you won’t have access to ``get()``. You can also change the default namespace from ``CONFIG`` to something else. 