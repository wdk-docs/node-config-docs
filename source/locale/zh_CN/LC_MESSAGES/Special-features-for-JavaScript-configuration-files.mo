��          �                 t     1   �     �  
  �  �   �  �   �  �   4     �  S     T   U  3   �  �   �  !   �  �  �  K   ]  �  �  ^   +
  %   �
     �
  �   �
  �   �  z   *  �   �     (  D   ;  R   �  %   �  �   �  &   �  ?  �  H       Because the resolution of ``fullName`` is deferred, it would resolve to refer to the overridden first and last name. Deferred values in JavaScript configuration files Example: Files ending in ``.js`` are loaded and run as a JavaScript module. The module must export the configuration object. Some folks appreciate the ability to compute configurations, others feel it’s not the right thing to do. It’s nice to live in a world with choice. For example, you set up a default value for a “full name” that is calculated from “first name” and “last name” values which will be provided a config file which overrides the defaults. If you’d like to include values from another file in JavaScript, no special syntax is required–the full features of Node.js are already available! In the JavaScript modules you have the option to define a configuration value as a function whose resolution will be deferred until the final merged configuration structure is built. Including other files JavaScript modules support the ability to have “deferred” and “raw” values. Promises or other objects can be included in JavaScript files using the same method. Special features for JavaScript configuration-files The use of `ECMAScript 5 getters <http://javascriptplayground.com/blog/2013/12/es5-getters-setters/>`_ in JavaScript configurations is not supported. Using deferred configuration values is the recommended alternative. Then in ``config/production.js``: There may be instances where you would like to place a complex object like ``process.stdout`` into your configuration file, e.g. logging configuration. But node-config achieves its useful functionality by modifying the config object prototypes then making them immutable - not ideal for ``process.stdout``! But you can still achieve the goal by using the ``raw`` functionality like so: Using promises, process.stdout and other objects in JavaScript config files Project-Id-Version: node-config docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-28 19:32+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 因为 ``fullName`` 的分辨率被推迟,所以它将决定引用被覆盖的名字和姓氏. JavaScript配置文件中的延迟值 例: 以 ``.js`` 结尾的文件将作为JavaScript模块加载并运行.模块必须导出配置对象.有些人欣赏计算配置的能力,有些人则认为这不是正确的做法.住在一个有选择的世界里真好. 例如,您为 “full name” 设置默认值,该值根据 “first name” 和 “last name” 值计算,将提供一个覆盖默认值的配置文件. 如果您想在JavaScript中包含来自其他文件的值,则不需要特殊语法 -  Node.js的完整功能已经可用! 在JavaScript模块中,您可以选择将配置值定义为一种函数,其分辨率将延迟到构建最终的合并配置结构. 包括其他文件 JavaScript模块支持具有“延迟”和“原始”值的功能. 可以使用相同的方法将Promises或其他对象包含在JavaScript文件中. JavaScript配置文件的特殊功能 不支持在JavaScript配置中使用 `ECMAScript 5 getters <http://javascriptplayground.com/blog/2013/12/es5-getters-setters/>`_. 建议使用延迟配置值. 然后进去 ``config/production.js``: 在某些情况下,您可能希望将一个复杂的对象(如 ``process.stdout``)放入配置文件中,例如:记录配置.但是node-config通过修改配置对象原型然后使它们成为不可变来实现其有用的功能 - 不适合 ``process.stdout``! 但你仍然可以通过使用 ``raw`` 功能实现目标: 在JavaScript配置文件中使用promises,process.stdout和其他对象 