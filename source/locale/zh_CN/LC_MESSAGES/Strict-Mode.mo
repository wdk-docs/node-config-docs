��          �               �   -   �        �  /  J  �  :    b   O  -   �  +   �  R     �  _     �  �   �  �  �  /   
     O
  �  \
  /  �      \   3  "   �  $   �  F   �  ?       _  �   o   *Strict Mode was added in node-config 1.9.0.* Diagnostic messages Files named ``default`` and ``local`` have a special place in the config loading order. Since we also support files simply named after ``NODE_ENV`` we can’t be sure whether a file named ``default`` or ``local`` was meant be represent one of these special files, or after your NODE_ENV. Without Strict Mode, these files could end up being loaded *twice* in the load order which is probably not what you want. If ``NODE_APP_INSTANCE`` is set in the environment, we check if there any file matching that name in the ``config/`` directory. If there’s actually no problem, create a file name matching the desired ``NODE_ENV`` value: ``default-{NODE_APP_INSTANCE}.json`` and include the contents ‘{}’, which is an empty valid JSON object. If ``NODE_ENV`` is set in the environment, we check if there is any file matching that name in the ``config/`` directory containing valid syntax. You can create a file with the name matching the desired ``NODE_ENV`` value: ``{NODE_ENV}.json`` and include the contents ‘{}’, which is an empty valid JSON object. NODE_APP_INSTANCE value of ‘{NODE_APP_INSTANCE}’ did not match any instance config file names. NODE_ENV value of ‘default’ is ambiguous. NODE_ENV value of ‘local’ is ambiguous. NODE_ENV value of ‘{NODE_ENV}’ did not match any deployment config file names. Several checks are made to make sure that ``NODE_ENV`` and ``NODE_APP_INSTANCE`` values are sensible. If something appears to be unsafe or ambiguous, a warning will always be issued. If ``NODE_CONFIG_STRICT_MODE`` is set to ‘true’ or ‘1’ in the environment, an exception will be thrown to ensure that the application doesn’t start up with a configuration that might be broken. Strict Mode This could also indicate a problem with specifying your `configuration directory or the file load order <https://github.com/lorenwest/node-config/wiki/Configuration-Files>`_. Project-Id-Version: node-config docs 
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
 *在node-config 1.9.0中添加了严格模式.* 诊断信息 名为 ``default`` 和 ``local`` 的文件在配置加载顺序中有一个特殊的位置.由于我们也支持简单地命名为 ``NODE_ENV`` 的文件, 我们无法确定名为 ``default`` 或 ``local`` 的文件是代表这些特殊文件之一, 还是代表NODE_ENV之后.如果没有严格模式, 这些文件最终可能会在加载顺序中加载 *两次*, 这可能不是您想要的. 如果在环境中设置了 ``NODE_APP_INSTANCE``, 我们检查 ``config/`` 目录中是否有与该名称匹配的文件.如果确实没有问题, 请创建一个与所需 ``NODE_ENV`` 值匹配的文件名: ``default-{NODE_APP_INSTANCE}.json`` 并包含内容 '{}', 这是一个空的有效JSON对象. 如果在环境中设置了 ``NODE_ENV``, 我们检查在包含有效语法的 ``config/`` 目录中是否有与该名称匹配的文件.您可以创建一个名称与所需 ``NODE_ENV`` 值匹配的文件: ``{NODE_ENV}.json`` 并包含内容 '{}', 这是一个空的有效JSON对象. ‘{NODE_APP_INSTANCE}’ 的NODE_APP_INSTANCE值与任何实例配置文件名都不匹配. 'default' 的NODE_ENV值不明确. “local” 的NODE_ENV值不明确. '{NODE_ENV}' 的NODE_ENV值与任何部署配置文件名都不匹配. 进行了几项检查以确保 ``NODE_ENV`` 和 ``NODE_APP_INSTANCE`` 值是合理的.如果某些东西看起来不安全或含糊不清, 将始终发出警告.如果在环境中将 ``NODE_CONFIG_STRICT_MODE`` 设置为 'true' 或 '1', 则会抛出异常以确保应用程序无法使用可能已损坏的配置启动. 严格的模式 这也可能表示指定您的 `配置目录或文件加载顺序 <https://github.com/lorenwest/node-config/wiki/Configuration-Files>`_ 时出现问题. 