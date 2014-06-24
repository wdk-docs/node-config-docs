## Major Revision

Version 1.0 is a major revision release - a nice way of saying it may break something relying on a prior version.  There is one fairly large difference, and a few you probably won't notice.

### Immutable Configurations

Changing configurations after the first ```require('config');``` is not supported as of 1.0.  It was the feature causing the most confusion, support, code complexity, and frankly - what were we thinking?

If you relied on the ability to alter configurations at runtime, you will have to replace that with a different implementation, or continue using the 0.4.x release branch.

This is the most significant compatibility change, and it came only after serious consideration and community input.  Going forward, configurations can be relied on to not change.

And to take it one step further, configuration values are made immutable so attempts to change them will be silentaly
