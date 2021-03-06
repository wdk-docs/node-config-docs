Upgrading From Config 0.x
========================================================================================

Incompatible Changes
--------------------

Version 1.0 is a major revision release - a nice way of saying it may
break something relying on a prior version. There are two incompatible
changes - one fairly large and one you probably won’t notice.

Immutable Configurations
~~~~~~~~~~~~~~~~~~~~~~~~

Updating configurations at runtime is no longer supported. It was the
feature causing the most confusion, support, code complexity, and
frankly - what were we thinking?

If you relied on the ability to alter configurations at runtime, you
will have to replace that with a different implementation, or continue
using the 0.4.x release branch. This is the most significant
compatibility change, and it came only after serious consideration and
community input.

Startup code may still set and extend configurations as long as it’s
done before the first use of the ``config.get()`` method. This allows
your app startup to load and merge configurations from external sources.
If this startup code needs access to config values without calling
``config.get()`` you can access values directly from the config object.

In addition, some use cases such as tests require config mutations.
An :ref:`Environment-Variables-allow_config_mutations` has been added to address these edge cases.

Guaranteeing the stability of configuration values is now a core part of node-config.

Load Ordering
~~~~~~~~~~~~~

Load ordering has been changed from ``hostname.EXT --> deployment.EXT``
to ``deployment.EXT --> hostname.EXT`` because deployments can be on
multiple machines, and are a *higher level* than host configurations,
which by definition are only applicable to a single host.

This is unlikely to affect anyone, because it didn’t make sense to have
deployment level configs overwriting host level configs, but it’s
something to be aware of.

New Features
------------

config.get() and config.has()
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The top level config object and all sub-objects have a ``get()``
function exposed as the preferred method of accessing configuration
values. This gives you the option of doing this:

::

   var config = require('config');
   var customerDbHost = config.Customer.dbConfig.host;

which is like prior versions that perform no validation, or this:

::

   var customerDbHost = config.get('Customer').get('dbConfig').get('host');

which throws an exception on typos but is kind of wordy, or this:

::

   var customerDbHost = config.get('Customer.dbConfig.host');

win.

Using ``get()`` is the preferred method because it fails fast if you
misspell(sp?) a parameter or if the configs weren’t loaded for some
reason.

If you want to test if a configuration without wrapping in a try/catch,
``has()`` is available at all config levels:

::

   if (config.has('Customer.dbConfig')) {
      ...
   }

config.util
~~~~~~~~~~~

The config package comes with a bunch of :doc:`Using-Config-Utilities`,
resulting in a large list of :doc:`Reserved-Words`
that couldn’t be used in configurations.

Starting with node-config 1.0, these utilities have been moved to a
single ``util`` object attached to configuration objects. Using these
utilities from ``config`` vs. \ ``config.util`` will cause a deprecation
warning in node-config 1.0,
and will not be supported in :ref:`Future-Compatibility-upcoming-incompatibilities`.

This ``util`` object is available at all levels, so if you do something
like this:

::

   var dbConfig = require('config').get('Customer.dbConfig');

you’ll still be able to access config utilities using ``dbConfig.util``.
For example, if you wanted a deep clone of a JavaScript object, you
could do this:

::

   var clonedObject = dbConfig.util.cloneDeep(myObject);
