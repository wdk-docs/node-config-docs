��          �               \  I   ]  >   �  =   �  g   $  E   �  �   �     W  P   n  �   �  �   P            O   2     �  P   �  |   �  �   ^  v   	  Y   �  �  �  7   \	  @   �	  ?   �	  R   
  E   h
  e   �
       K   .  �   z  �     
   �     �  H   �     %  C   9  Z   }  �   �  m   h  T   �   A consistent interface for :doc:`Configuration-Files` your configurations A way to pass configurations via :doc:`Command-Line-Overrides` A way to pass configurations via :doc:`Environment-Variables` Are you the author of a NodeJS `NPM module <http://npmjs.org>`_ that accepts initialization parameters? By following a common pattern, you give developers using your module: For example, they can put your module configurations next to their other configurations and extend configs based on deployment type: Here’s how it works: If so, and you’re following a pattern like this for your module configuration: It unifies your module configuration with apps choosing to use node-config, and stays out of the way for apps using other configuration systems. Load node-config at the top of your module like normal, and specify the :doc:`Environment-Variables` so applications don’t get *No config files* warnings if they aren’t using node-config. Or this: Sub Module Configuration Then do something like this where your configurations are passed in by the app: Then read on. Then use the config object as usual to access configurations within your module: This is an easy way to add new configuration functionality to your NPM module, while staying compatible with existing usage. This pattern gives apps using your module the choice of using node-config mechanisms for configuration, or using your existing methods (as shown at the top of this page). Without breaking existing usage of your module, and without requiring node-config in their own app (unless they want). `Other features <https://github.com/lorenwest/node-config/wiki>`_ built in to node-config Project-Id-Version: node-config docs 
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
 一致的接口 :doc:`Configuration-Files` 您的配置 一种通过 :doc:`Command-Line-Overrides` 传递配置的方法 一种通过 :doc:`Environment-Variables` 传递配置的方法 您是接受初始化参数的NodeJS `NPM模块 <http://npmjs.org>`_ 的作者吗? 通过遵循通用模式, 您可以为开发人员使用您的模块: 例如, 他们可以将您的模块配置放在其他配置旁边, 并根据部署类型扩展配置: 这是它的工作原理: 如果是这样, 并且您正在为您的模块配置遵循这样的模式: 它将您的模块配置与选择使用node-config的应用程序统一起来, 并保持对使用其他配置系统的应用程序不远. 像正常一样在模块顶部加载node-config,并指定 :doc:`Environment-Variables`, 这样应用程序就不会获得 *没有配置文件* 警告,如果他们没有使用node-config。 或这个: 子模块配置 然后执行类似这样的操作, 您的配置将由应用程序传入: 然后继续阅读. 然后像往常一样使用配置对象来访问模块中的配置: 这是向NPM模块添加新配置功能的简便方法, 同时与现有使用保持兼容. 此模式为使用您的模块的应用程序提供了使用node-config机制进行配置或使用现有方法的选择(如本页顶部所示). 不破坏模块的现有用法, 也不需要在自己的应用程序中使用node-config(除非他们想要). `其他功能 <https://github.com/lorenwest/node-config/wiki>`_ 内置于node-config 