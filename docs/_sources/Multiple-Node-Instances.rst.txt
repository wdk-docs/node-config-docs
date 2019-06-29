Multiple Node Instances
========================================================================================

In order to support different configurations for each application
instance running on a machine, the :doc:`Environment-Variables`
is inspected, and used for loading instance specific files.

For example, if the ``NODE_APP_INSTANCE=3`` environment variable is set,
immediately following the load of ``default.json``, a file by the name
of ``default-3.json`` will be loaded if present.

This works for all configuration files, so if your
``NODE_APP_INSTANCE=3`` and ``NODE_ENV=stage``, then immediately after
loading ``stage.yaml``, a file by the name of ``stage-3.yaml`` will be
loaded if present.
