## Compatibility Statement

In acknowledgement of the effort required to change software using node-config, beginning with release version 1.0.0 node-config will use [semver versioning](https://github.com/lorenwest/node-config/wiki/Future-Compatibility#semver-versioning) to promote stable deployments, limit backward incompatibilities whenever possible, provide [ample warning](https://github.com/lorenwest/node-config/wiki/Future-Compatibility#ample-warning) for upcoming incompatible releases, and post all [upcoming incompatibilities](https://github.com/lorenwest/node-config/wiki/Future-Compatibility#upcoming-incompatibilities) on this page. 

### Semver Versioning

In order to promote stable deployments, node-config uses [semver versioning](http://semver.org/) when expressing deployment versions.

This makes it appropriate to run tests in a particular ```MAJOR.MINOR``` version, and be confident about specifying a wildcard ```PATCH``` version.  For example, if the current version you've tested with is ```1.3.4```, your node-config dependency in package.json could be:
"dependencies": {
  ...
  "config": "1.3.x",
  ...
}
without introducing too much risk.  You can also specify ```1.3.4``` if you want to assume no risk of change, but by doing so you're trading that for the risk of continuing to use versions with known bugs.

### Ample Warning

### Upcoming Incompatibilities