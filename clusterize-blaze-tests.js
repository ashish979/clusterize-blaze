// Import Tinytest from the tinytest Meteor package.
import { Tinytest } from "meteor/tinytest";

// Import and rename a variable exported by clusterize-blaze.js.
import { name as packageName } from "meteor/ashish979:clusterize-blaze";

// Write your tests here!
// Here is an example.
Tinytest.add('clusterize-blaze - example', function (test) {
  test.equal(packageName, "clusterize-blaze");
});
