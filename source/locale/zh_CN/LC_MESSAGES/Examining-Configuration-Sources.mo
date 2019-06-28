��          T               �     �      �  "   �  �   �  �     V     �  p    �     �  "     �   +  �   �  V   n   Configurations are similar to CSS in that they *cascade* from less specific to more specific. The ``config.util.getConfigSources();`` method can be used to see all sources contributing to the ultimate configuration, and the order in which they were are applied. Examining Configuration Sources Example output of getConfigSources Notice that in additon to full paths, some other special names are included: ``$NODE_CONFIG`` from the environment and ``--NODE_CONFIG argument`` from the command line. This would allow a UI similar to a CSS inspector to show all source values, with strikethroughs for values overwritten by more specific cascading values. While ``[Object]`` is shown here, the full objects are available in the actual output. Project-Id-Version: node-config docs 
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
 Configurations are similar to CSS in that they *cascade* from less specific to more specific. The ``config.util.getConfigSources();`` method can be used to see all sources contributing to the ultimate configuration, and the order in which they were are applied. 检查配置源 Example output of getConfigSources Notice that in additon to full paths, some other special names are included: ``$NODE_CONFIG`` from the environment and ``--NODE_CONFIG argument`` from the command line. This would allow a UI similar to a CSS inspector to show all source values, with strikethroughs for values overwritten by more specific cascading values. While ``[Object]`` is shown here, the full objects are available in the actual output. 