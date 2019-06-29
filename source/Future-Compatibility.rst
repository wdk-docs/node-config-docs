.. _Future-Compatibility-compatibility-statement:

Future Compatibility
==============================

In acknowledgement of the effort required to change dependent software, node-config will:

- Use :ref:`Future-Compatibility-semver-versioning` to promote stable deployments,
- Limit backward incompatibilities in favor of alternate solutions,
- Provide :ref:`Future-Compatibility-ample-warning` for upcoming incompatible releases,
- Attempt to detect and output errors on incompatible usage, and
- Post all :ref:`Future-Compatibility-upcoming-incompatibilities` on this page

.. _Future-Compatibility-semver-versioning:

Semver Versioning
----------------------------

To promote stable deployments, node-config uses `semver versioning <http://semver.org/>`_ when expressing deployment versions.

This makes it appropriate to run tests for a particular ``MAJOR.MINOR``
version, and be confident about specifying a wildcard ``PATCH`` version.
For example, if the current version you’ve tested with is ``1.3.4``,
your node-config dependency in package.json could be:

::

   "dependencies": {
     "config": ">=1.3.4 <1.4.0",
     ...

without introducing significant risk. You can also specify
``"config": "1.3.4",`` if you prefer version stability to bug fixes.

.. _Future-Compatibility-ample-warning:

Ample Warning
---------------------

A minimum of one year will be given between the time of an
incompatibility announcement (below) and the release of the version
containing the incompatibility.

If it’s possible to detect your application using a future
incompatibility, a one-time warning per application run will be placed
onto ``console.error`` for each type of incompatibility.

Once the incompatibility is introduced, an error will be placed into
``console.error`` if an incompatible usage is detected.

.. _Future-Compatibility-upcoming-incompatibilities:

Upcoming Incompatibilities
--------------------------------------

.. _Future-Compatibility-version-20---not-before-july-2015:

Version 2.0 - (not before July, 2015)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

-  Less Cluttered Top Level Namespace (announced June, 2014)\ :doc:`Using-Config-Utilities`
   available under the ``config.util`` namespace since version 1.0 will
   no longer be available at the top level ``config`` namespace.
   Starting at Version 2 they will only be available under
   :doc:`Reserved-Words` list will be ``get``, ``has``, and ``util``.

-  Watch utility deprecated (announced July, 2014) The ``watch`` method
   was built as a notification of changed configuration values. Since
   node-config 1.0, configuration changes are no longer advised, and the
   watch function was kept in but deprecated with a warning. The watch
   function will not be available in Version 2.0.
