# Mocha

Mocha JavaScript test framework

# Run single test

<http://stackoverflow.com/questions/10832031/how-to-run-a-single-test-with-mocha#10833633>
<http://jaketrent.com/post/run-single-mocha-test>

    `npm bin`/mocha --compilers mocha \
                    --grep "name of your test" \
                    path/to/test.js

## CoffeeScript

    `npm bin`/mocha --compilers mocha \
                    --compilers coffee:coffee-script/register \
                    path/to/test.coffee

# Timeout

<https://mochajs.org/#timeouts>

## All test

All test up to 1 minute

    `npm bin`/mocha --compilers mocha --timeout 60000 path/to/test.js

## Single test

Run single test and wait up to 10 minute

~~~js
it('Your test description', function() {
  this.timeout(600000);
  return assert.equal(2, 2);
});
~~~
