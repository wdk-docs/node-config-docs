��          L               |      }      �   �     �   �  �   C  �  �     Q  e   a  �   �  g   Z  [   �   Command Line Overrides Configurations can be overridden by specifying ``--NODE_CONFIG='{...}'`` command line parameter when starting your application. The ``NODE_CONFIG`` parameter may also be supplied `as a shell environment variable <https://github.com/lorenwest/node-config/wiki/Environment-Variables#node_config>`_ The parameter value must be supplied as a valid JSON string. The following example overrides the Customer.dbConfig.host configuration: The single quotes around the JSON value preserve the double quotes, and you may have to escape special characters, based on your O/S shell. Project-Id-Version: node-config docs 
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
 命令行覆盖 在启动应用程序时, 可以通过指定 `--NODE_CONFIG ='{...}'` 命令行参数来覆盖配置. ``NODE_CONFIG`` 参数也可以 `作为shell环境变量提供 <https://github.com/lorenwest/node-config/wiki/Environment-Variables#node_config>`_ 必须将参数值作为有效的JSON字符串提供.以下示例将覆盖Customer.dbConfig.host配置: JSON值周围的单引号保留双引号, 您可能必须根据O/S shell转义特殊字符. 