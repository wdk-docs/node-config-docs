��          <               \   #   ]   �   �   �   p  �  K     �  �   �  �   �   Configuring from an External Source In a nutshell: define only external source connection settings in files, using those settings to connect to the source. Once connected, read additional configurations and add them to the config object returned from ``require('config');``. Make sure any external overrides are done in the application bootstrap - before anyone calls the first ``config.get();``, because the config object is made immutable as soon as any client uses the values via ``get()``. Project-Id-Version: node-config docs 
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
 从外部源配置 In a nutshell: define only external source connection settings in files, using those settings to connect to the source. Once connected, read additional configurations and add them to the config object returned from ``require('config');``. Make sure any external overrides are done in the application bootstrap - before anyone calls the first ``config.get();``, because the config object is made immutable as soon as any client uses the values via ``get()``. 