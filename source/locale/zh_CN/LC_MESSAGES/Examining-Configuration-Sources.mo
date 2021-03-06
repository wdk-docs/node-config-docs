��          T               �     �      �  "   �  �   �  �     V     �  p  �   �     �     �  �   �  k   ~  I   �   Configurations are similar to CSS in that they *cascade* from less specific to more specific. The ``config.util.getConfigSources();`` method can be used to see all sources contributing to the ultimate configuration, and the order in which they were are applied. Examining Configuration Sources Example output of getConfigSources Notice that in additon to full paths, some other special names are included: ``$NODE_CONFIG`` from the environment and ``--NODE_CONFIG argument`` from the command line. This would allow a UI similar to a CSS inspector to show all source values, with strikethroughs for values overwritten by more specific cascading values. While ``[Object]`` is shown here, the full objects are available in the actual output. Project-Id-Version: node-config docs 
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
 配置类似于CSS, 因为它们 *级联* 从较不具体到更具体. ``config.util.getConfigSources();`` 方法可用于查看有助于最终配置的所有源, 以及它们的应用顺序. 检查配置源 getConfigSources的输出示例 请注意, 除了完整路径之外, 还包括一些其他特殊名称: 来自环境的 ``$NODE_CONFIG`` 和来自命令行的 ``--NODE_CONFIG argument`` . 这将允许类似于CSS检查器的UI显示所有源值, 并且更多特定级联值覆盖值的删除线. 虽然这里显示了 ``[Object]``, 但实际输出中有完整的对象. 