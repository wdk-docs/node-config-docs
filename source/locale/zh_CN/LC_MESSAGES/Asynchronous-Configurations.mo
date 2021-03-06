��          t               �   I   �   `        x     �  \   �  T        Z  �   y  w     �   �  �  h  T   �  L   ?     �     �  =   �  6   �       �   .  `   �  �      **Important!** - Never call ``config.get`` before ``resolveAsyncConfigs`` **Note**: support of advance syntax will depend on your node version and/or babel configurations Async configuration Asynchronous Configurations In the JavaScript modules you have an option to define a configuration value asynchronously. It will cause the config object to freeze and will make resolving values impossible. Resolving async configurations Using the ``asyncConfig`` utility method you can wrap both promises and async functions (a function which returns a promise) whose resolution will be deferred until: the ``resolveAsyncConfigs`` utility method has been called and resolved (all asynchronous configurations been resolved) the final merged configuration structure is built (that’s when async functions are executed; see :ref:`Special-features-for-JavaScript-configuration-files-deferred-values-in-javascript-configuration-files`) Project-Id-Version: node-config docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-29 20:11+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 **Important!** - 永远不要在 ``resolveAsyncConfigs`` 之前调用 ``config.get`` **Note**: 支持高级语法将取决于您的节点版本和/或babel配置 异步配置 异步配置 在JavaScript模块中, 您可以选择异步定义配置值. 它会导致配置对象冻结, 并且无法解析值. 解决异步配置 使用 ``asyncConfig`` 实用程序方法, 你可以包含promises和async函数(一个返回一个promise的函数), 其解析将推迟到: 已经调用并解析了 ``resolveAsyncConfigs`` 实用程序方法(已解决所有异步配置) 构建最终的合并配置结构(即异步函数执行时;参见 :ref:`Special-features-for-JavaScript-configuration-files-deferred-values-in-javascript-configuration-files`) 