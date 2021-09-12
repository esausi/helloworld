# helloworld

App for deploy a nodejs with mocha testing
Used as an example with Jenkins pipelines

## Usefull commands

```js
# Run tests
%> npm run test
```

Test command configuration on: package.json 

```
%> cat package.json
...
 "scripts": {
    "test": "node_modules/mocha/bin/mocha"
  },
...
```

Test configuration on: ./test/helloworld_test.js
using zombie and assert modules

```
%> cat ./test/helloworld_test.js
#Import modules
var Browser = require('zombie')
var assert = require('assert')

#Import app code
var app = require('../helloworld')

#Define tests
describe('main page', function(){
    #Declare variables and variable initialization
    before(function() {
        this.browser = new Browser({ site: 'http://localhost:3000'})
    })
    #Execute functionality previous to test
    before(function(done) {
        this.browser.visit('/', done)
    })
    #Apply validation to result
    it('should say hello world', function(){
        assert.ok(this.browser.success)
        assert.equal(this.browser.text(), "Hello World")
    })
})

```


