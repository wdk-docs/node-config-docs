To [retain compatibility](https://github.com/lorenwest/node-config/wiki/Future-Compatibility#compatibility-statement) with pre-1.0, the following configuration names cannot be used in version 1.0.
```
get
has
util
getConfigSources
makeHidden
makeImmutable
setModuleDefaults
watch 
_attachProtoDeep
_cloneDeep
_diffDeep
_equalsDeep
_extendDeep
_get
_getCmdLineArg 
_initParam
_isObject
_loadFileConfigs
_parseFile
_stripComments
_stripYamlComments
```

Starting with [version 2.0](https://github.com/lorenwest/node-config/wiki/Future-Compatibility#version-20---not-before-july-2015), config [utilities](https://github.com/lorenwest/node-config/wiki/Using-Config-Utilities) will only be accessible under ```util```, and the following keywords will be reserved:
```
get
has
util
````