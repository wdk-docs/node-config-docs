_Strict Mode was added in Node 1.9.0._

Several checks are made to make sure that `NODE_ENV` and `NODE_APP_INSTANCE` values are sensible. If something appears to be unsafe or ambiguous, a warning will always be issued.  If `NODE_CONFIG_STRICT_MODE` is set to a true value in the environment, an exception will be thrown to insure that the application doesn't start up with a configuration that might be broken.  

## Diagnostic messages 

###  NODE_ENV value of '{NODE_ENV}' did match any deployment config file names.

If `NODE_ENV` is set in the environment, we check if there any file matching that name in the `config/` directory. If there's actually no problem, create a file name matching the desired `NODE_ENV` value: `{NODE_ENV}.json` and include the contents '{}', which is an empty valid JSON object.

### NODE_APP_INSTANCE value of '{NODE_APP_INSTANCE}' did match any instance config file names.

If `NODE_APP_INSTANCE` is set in the environment, we check if there any file matching that name in the `config/` directory. If there's actually no problem, create a file name matching the desired `NODE_ENV` value: `default-{NODE_APP_INSTANCE}.json` and include the contents '{}', which is an empty valid JSON object.

###  NODE_ENV value of 'default' is ambiguous.
###  NODE_ENV value of 'local' is ambiguous.

Files named `default` and `local` have a special place in the config loading order. Since we also support files simply named after `NODE_ENV` we can't be sure whether a file named `default` or `local` was meant be represent one of these special files, or after your NODE_ENV. Without Strict Mode, these files could end up being loaded _twice_ in the load order which is probably not what you want.


