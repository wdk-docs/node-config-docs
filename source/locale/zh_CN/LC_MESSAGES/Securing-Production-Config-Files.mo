��    3      �              L  7   M    �  L   �  �   �  �   �  -   W  $   �  J   �  E   �     ;     P     d  ,   w  �   �  [   U  �   �     O	  *   ]	  c   �	     �	  I   �	     C
  `   ]
  $   �
  p   �
  E   T  c   �  D   �  W   C  H   �  T   �  �  9  .   �  d   �  �   `      �       K   $  �   p  T     �   \  M   �  �   @  d     5   �  I   �  c     w   f  B   �     !  �  /  :   �  �   �  V   �  �   $  �   	  -   �  +   �  M   �  G   ?     �     �     �  "   �  �   �  d   �  z   �     `  $   m  Q   �     �  D   �     0  T   C  &   �  p   �  G   0  g   x  H   �  X   )  H   �  Y   �  D  %   (   j!  F   �!  �   �!     ^"     w"  ;   ~"  �   �"  B   <#  �   #  8   $  �   F$  W   �$  /   J%  B   z%  I   �%  k   &  ?   s&     �&   Add Paul’s public GPG key as a trusted git-crypt user Add the ``config/production.json`` file (or equivalent YAML etc) to the ``.gitattributes file``, so git-crypt will manage the encryption/decryption where necessary. Add the following line to the ``.gitattributes`` file (substituting the appropriate extension): Add your own public GPG key (already on your GPG keychain) as a trusted user But Ringo has a problem: when he runs the node program with ``NODE_ENV=production``, node-config tries to read ``config/production.json``, which on his machine is not a valid JSON file since it’s encrypted. The app crashes. But his public key is listed as trusted, and he has the corresponding private key on his keyring. So he can unlock all encrypted files with a single command: Deployment Servers, Build Servers, CI Servers Do the same for ``paul@example.com`` From Ringo’s point of view, ``config/production.json`` is a binary file. From now on, Paul’s and your own workflow is unchanged from normal. Git Clone Every Time Git Clone Once Only Git-crypt Workflow Here is the scenario we’ll be configuring: If you *have* accidentally committed sensitive information to your repository, you’ll need to clean it using `bfg repo cleaner <https://rtyley.github.io/bfg-repo-cleaner/>`_. Import Paul’s public GPG key to your own GPG keychain (Paul probably emailed this to You) In the case where your server *is* performing a git clone every time, you can instead export a symmetric (non-GPG) key from an unlocked git-crypt repository: Initial Setup Initialise the repository to use git-crypt Initially, when Paul clones or pulls the repo, ``config/production.json`` is encrypted for him too. Introduction Mark both your own key and Paul’s key with ‘ultimate’ trust in GPG. Mimicking production mode Now create the file and add it to your repo (substituting the appropriate syntax and extension): On OS X : ``brew install git-crypt`` On OS X, the GPG Keychain that is part of `GPG Suite <https://gpgtools.org/gpgsuite.html>`_ is very easy to use. On Ubuntu/Debian (since 16.04 LTS) ``sudo apt-get install git-crypt`` On Unix/Linux, `GPA <https://www.gnupg.org/related_software/gpa/index.html>`_ provides a front-end. On Windows, `GPG4Win <https://www.gpg4win.org/>`_ looks pretty good. On other systems: `INSTALL <https://github.com/AGWA/git-crypt/blob/master/INSTALL.md>`_ On the git remote (server), ``config/production.json`` is now encrypted. On your machine and Paul’s, ``config/production.json`` is just a normal JSON file. Once you have split out your production config, you may want to encrypt any files that contain sensitive information (API Keys, passwords etc). This page will get you started with `git-crypt <https://github.com/AGWA/git-crypt>`_ , which works well with node-config. With git-crypt, you can keep your production config files under version control with git, while also keeping them secure via encryption. Paul is prompted for his private key password. Ringo is a contributor, and doesn’t need or want to see production passwords, API secret keys etc. Ringo might have the need to run the application with ``NODE_ENV=production`` e.g. to invoke minification, or to debug some issue on the production server. Securing Production Config Files Steps This tells node-config to continue even if a git-crypt file is encountered. To cater for this, Ringo can specify that any git-crypt encrypted files are skipped, via a ``CONFIG_SKIP_GITCRYPT`` environment variable, for example: Unless you’re cloning the git repository every time, you need only unlock it once. We’re going to set up git-crypt so that the ``production.json`` file is encrypted for Ringo, but the same file is plain JSON for yourself and Paul. You and Paul both maintain the servers and need access to the sensitive info. You can create a GPG key for a server (or set of servers) so a single ``git-crypt unlock`` command is all that is needed. Of course, the corresponding private key must be installed on the server’s GPG keychain already. You can then use that symmetric key to unlock the repository from your server without a pass phrase. You have `GnuPG <https://www.gnupg.org/>`_ installed. You have a ``config`` folder where your configuration files will be kept. You, Paul and Ringo are all working on a project, using git. There are server deployments involved. Your project is using git, your working copy is clean, and you haven’t committed any sensitive information to it yet. `git-crypt <https://github.com/AGWA/git-crypt.git>`_ is installed. 先决条件: Project-Id-Version: node-config docs 
Report-Msgid-Bugs-To: 
POT-Creation-Date: 2019-06-28 23:07+0800
PO-Revision-Date: YEAR-MO-DA HO:MI+ZONE
Last-Translator: FULL NAME <EMAIL@ADDRESS>
Language: zh_CN
Language-Team: zh_CN <LL@li.org>
Plural-Forms: nplurals=1; plural=0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Generated-By: Babel 2.6.0
 将Paul的公共GPG密钥添加为可信的git-crypt用户 将 ``config/production.json`` 文件(或等效的YAML等)添加到 ``.gitattributes文件`` 中, 因此git-crypt将在必要时管理加密/解密.将以下行添加到``.gitattributes`` 文件中(替换相应的扩展名): 添加您自己的公共GPG密钥(已在您的GPG钥匙串上)作为受信任的用户 但是Ringo有一个问题:当他用 ``NODE_ENV=production`` 运行节点程序时, node-config尝试读取 ``config/production.json``, 这在他的机器上不是有效的JSON文件, 因为它是加密的.该应用程序崩溃. 但是他的公钥被列为可信任, 并且他的密钥环上有相应的私钥.因此, 他可以使用一个命令解锁所有加密文件: 部署服务器, 构建服务器, CI服务器 为 ``paul@example.com`` 做同样的事情 从Ringo的角度来看, ``config/production.json`` 是一个二进制文件. 从现在开始，Paul和您自己的工作流程与正常情况相同. 每次Git克隆 Git克隆一次 Git-crypt 工作流程 这是我们将要配置的场景: 如果您*意外地将敏感信息提交到您的存储库, 您将需要使用 `bfg repo cleaner  <https://rtyley.github.io/bfg-repo-cleaner/>`_ 进行清理. 将Paul的公共GPG密钥导入您自己的GPG钥匙串(Paul可能会通过电子邮件发送给您) 如果您的服务器每次都 *执行* git clone, 则可以从未锁定的 git-crypt 存储库导出对称(非GPG)密钥: 初始设置 初始化存储库以使用git-crypt 最初, 当Paul克隆或拉回购时, ``config/production.json`` 也为他加密. 介绍 用GPG中的“终极”信任标记自己的密钥和Paul的密钥. 模仿生产模式 现在创建文件并将其添加到您的仓库(替换相应的语法和扩展名): 在OS X上: ``brew install git-crypt`` 在OS X上, 作为 `GPG Suite <https://gpgtools.org/gpgsuite.html>`_ 一部分的GPG Keychain非常易于使用. 在Ubuntu/Debian上(自16.04 LTS起) ``sudo apt-get install git-crypt`` 在Unix/Linux上, `GPA <https://www.gnupg.org/related_software/gpa/index.html>`_ 提供了一个前端. 在Windows上, `GPG4Win <https://www.gpg4win.org/>`_ 看起来很不错. 在其他系统上: `安装 <https://github.com/AGWA/git-crypt/blob/master/INSTALL.md>`_ 在git remote(服务器)上, ``config/production.json`` 现在已加密. 在你的机器上和Paul的, ``config/production.json`` 只是一个普通的JSON文件. 分离出生产配置后, 您可能希望加密包含敏感信息的任何文件(API密钥, 密码等).这个页面将开始使用 `git-crypt <https://github.com/AGWA/git-crypt>`_, 它适用于node-config.使用git-crypt, 您可以使用git将生产配置文件保留在版本控制下, 同时通过加密使其保持安全. 保罗被提示输入他的私钥密码. Ringo是贡献者, 不需要或不想看到生产密码, API密钥等. Ringo可能需要使用 ``NODE_ENV=production`` 运行应用程序, 例如调用缩小, 或调试生产服务器上的某些问题. 保护生产配置文件 脚步 即使遇到git-crypt文件, 这也告诉node-config继续. 为了满足这一需求, Ringo可以通过 ``CONFIG_SKIP_GITCRYPT`` 环境变量指定跳过任何git-crypt加密文件, 例如: 除非您每次都克隆git存储库, 否则只需要解锁一次. 我们将设置git-crypt, 以便为Ringo加密 ``production.json`` 文件, 但同样的文件对于你自己和Paul来说都是简单的JSON. 您和Paul都维护服务器并需要访问敏感信息. 您可以为服务器(或服务器集)创建GPG密钥, 因此只需要一个 ``git-crypt unlock`` 命令.当然, 必须在服务器的GPG钥匙串上安装相应的私钥. 然后, 您可以使用该对称密钥从服务器解锁存储库而无需密码短语. 你安装了 `GnuPG <https://www.gnupg.org/>`_. 你有一个 ``config`` 文件夹, 你的配置文件将被保存. 你, Paul和Ringo都在使用git从事一个项目.涉及服务器部署. 您的项目正在使用git, 您的工作副本是干净的, 并且您尚未向其提交任何敏感信息. `git-crypt <https://github.com/AGWA/git-crypt.git>`_ 已安装. 先决条件: 