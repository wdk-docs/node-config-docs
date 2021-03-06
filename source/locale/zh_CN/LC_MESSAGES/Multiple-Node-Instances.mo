��          D               l   �   m   �   .     �  �     �  �  �   Z  �   �     �  �   �   For example, if the ``NODE_APP_INSTANCE=3`` environment variable is set, immediately following the load of ``default.json``, a file by the name of ``default-3.json`` will be loaded if present. In order to support different configurations for each application instance running on a machine, the :doc:`Environment-Variables` is inspected, and used for loading instance specific files. Multiple Node Instances This works for all configuration files, so if your ``NODE_APP_INSTANCE=3`` and ``NODE_ENV=stage``, then immediately after loading ``stage.yaml``, a file by the name of ``stage-3.yaml`` will be loaded if present. Project-Id-Version: node-config docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-28 23:55+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 例如, 如果设置了 ``NODE_APP_INSTANCE=3`` 环境变量, 则在加载 ``default.json`` 之后立即加载一个名为 ``default-3.json`` 的文件. 为了支持在机器上运行的每个应用程序实例的不同配置, 检查 :doc:`Environment-Variables`, 并用于加载特定于实例的文件。 多节点实例 这适用于所有配置文件, 因此如果您的 ``NODE_APP_INSTANCE=3`` 和 ``NODE_ENV=stage``, 则在加载 ``stage.yaml`` 之后立即使用名为 ``stage-3.yaml`` 的文件.如果存在, 将加载. 