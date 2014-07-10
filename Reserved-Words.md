In node-config version 1.x, the following names cannot be used in configurations at any level:
```
get, has, util, getConfigSources, makeHidden, makeImmutable, setModuleDefaults, watch, 
_attachProtoDeep, _cloneDeep, _diffDeep, _equalsDeep, _extendDeep, _get, _getCmdLineArg, 
_initParam, _isObject, _loadFileConfigs, _parseFile, _stripComments, _stripYamlComments
```

Starting with version 2.x, the top level namespace will be accessible under ```util```, and only the following keywords will be reserved:
```
get, has, util
````