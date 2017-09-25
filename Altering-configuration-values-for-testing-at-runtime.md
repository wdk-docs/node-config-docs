This sample uses `mock-require` to alter values in the require cache and `import-fresh` to make sure the objects in the require cache are the newer versions. Testing library is `Lab` (Hapi.js ecosystem). 

```
const mockRequire = require("mock-require");
const importFresh = require("import-fresh");

// set up config overrides so that calls to http services will fail fast
process.env.NODE_CONFIG = JSON.stringify({
  httpServices: {retryInterval: 1, retries: 1} 
});

const testConfig = importFresh("config");
expect(
  testConfig.get("httpServices.retryInterval"),
  "config value not set to 1"
).to.equal(1);
mockRequire("config", testConfig);
```