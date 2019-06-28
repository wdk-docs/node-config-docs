��          D               l   �   m     .     C  �   [  �  /  �   �    r     �  �   �   For example, if the ``NODE_APP_INSTANCE=3`` environment variable is set, immediately following the load of ``default.json``, a file by the name of ``default-3.json`` will be loaded if present. In order to support different configurations for each application instance running on a machine, the ``NODE_APP_INSTANCE`` `environment variable <https://github.com/lorenwest/node-config/wiki/Environment-Variables>`_ is inspected, and used for loading instance specific files. Multiple Node Instances This works for all configuration files, so if your ``NODE_APP_INSTANCE=3`` and ``NODE_ENV=stage``, then immediately after loading ``stage.yaml``, a file by the name of ``stage-3.yaml`` will be loaded if present. Project-Id-Version: node-config docs 
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
 For example, if the ``NODE_APP_INSTANCE=3`` environment variable is set, immediately following the load of ``default.json``, a file by the name of ``default-3.json`` will be loaded if present. In order to support different configurations for each application instance running on a machine, the ``NODE_APP_INSTANCE`` `environment variable <https://github.com/lorenwest/node-config/wiki/Environment-Variables>`_ is inspected, and used for loading instance specific files. 多节点实例 This works for all configuration files, so if your ``NODE_APP_INSTANCE=3`` and ``NODE_ENV=stage``, then immediately after loading ``stage.yaml``, a file by the name of ``stage-3.yaml`` will be loaded if present. 