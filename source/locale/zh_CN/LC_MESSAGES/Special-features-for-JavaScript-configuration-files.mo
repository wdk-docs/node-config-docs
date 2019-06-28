��          �               ,  t   -  1   �     �  
  �  �   �  �   �  �   D     �  S     T   e  3   �  �   �  !   �  �  �  K   m  z   �  �  4	  t   �
  1   +     ]  
  f  �   q  �   6  �   �     �  S   �  T   �  %   C  �   i  !   C  �  e  K   �  z   4   Because the resolution of ``fullName`` is deferred, it would resolve to refer to the overridden first and last name. Deferred values in JavaScript configuration files Example: Files ending in ``.js`` are loaded and run as a JavaScript module. The module must export the configuration object. Some folks appreciate the ability to compute configurations, others feel it’s not the right thing to do. It’s nice to live in a world with choice. For example, you set up a default value for a “full name” that is calculated from “first name” and “last name” values which will be provided a config file which overrides the defaults. If you’d like to include values from another file in JavaScript, no special syntax is required–the full features of Node.js are already available! In the JavaScript modules you have the option to define a configuration value as a function whose resolution will be deferred until the final merged configuration structure is built. Including other files JavaScript modules support the ability to have “deferred” and “raw” values. Promises or other objects can be included in JavaScript files using the same method. Special features for JavaScript configuration-files The use of `ECMAScript 5 getters <http://javascriptplayground.com/blog/2013/12/es5-getters-setters/>`_ in JavaScript configurations is not supported. Using deferred configuration values is the recommended alternative. Then in ``config/production.js``: There may be instances where you would like to place a complex object like ``process.stdout`` into your configuration file, e.g. logging configuration. But node-config achieves its useful functionality by modifying the config object prototypes then making them immutable - not ideal for ``process.stdout``! But you can still achieve the goal by using the ``raw`` functionality like so: Using promises, process.stdout and other objects in JavaScript config files \``\` config = { // Load credit configs externally credit: JSON.parse(fs.readFileSync(‘./currentCreditPolicy.json’)) } Project-Id-Version: node-config docs 
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
 Because the resolution of ``fullName`` is deferred, it would resolve to refer to the overridden first and last name. Deferred values in JavaScript configuration files Example: Files ending in ``.js`` are loaded and run as a JavaScript module. The module must export the configuration object. Some folks appreciate the ability to compute configurations, others feel it’s not the right thing to do. It’s nice to live in a world with choice. For example, you set up a default value for a “full name” that is calculated from “first name” and “last name” values which will be provided a config file which overrides the defaults. If you’d like to include values from another file in JavaScript, no special syntax is required–the full features of Node.js are already available! In the JavaScript modules you have the option to define a configuration value as a function whose resolution will be deferred until the final merged configuration structure is built. Including other files JavaScript modules support the ability to have “deferred” and “raw” values. Promises or other objects can be included in JavaScript files using the same method. JavaScript配置文件的特殊功能 The use of `ECMAScript 5 getters <http://javascriptplayground.com/blog/2013/12/es5-getters-setters/>`_ in JavaScript configurations is not supported. Using deferred configuration values is the recommended alternative. Then in ``config/production.js``: There may be instances where you would like to place a complex object like ``process.stdout`` into your configuration file, e.g. logging configuration. But node-config achieves its useful functionality by modifying the config object prototypes then making them immutable - not ideal for ``process.stdout``! But you can still achieve the goal by using the ``raw`` functionality like so: Using promises, process.stdout and other objects in JavaScript config files \``\` config = { // Load credit configs externally credit: JSON.parse(fs.readFileSync(‘./currentCreditPolicy.json’)) } 