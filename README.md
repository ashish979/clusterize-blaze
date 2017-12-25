Clusterize-blaze
================

Clusterize-blaze is a modified version of [clusterize.js](https://clusterize.js.org/) 
to work with blaze. 

The problem with using clusterize.js with blaze is the reactivity of blaze. This package
maintains the reactivity of the template and apply clusterize on large list of data.

### Usage

Add the package using:

```
meteor add ashish979:clusterize-blaze
```

Import the package in your template javascript file:

```coffeescript
require 'meteor/ashish979:clusterize-blaze'
```

In you view file:

```spacebars
{{> clusterize data=list dataName='name' template='templateName' otherArg1='value' otherArg2='value' }}
```

### Description
 
```
data =  the array of document that you want to display in the list.

dataName = name of each document in the list that the template needs.

template = name of the template for each document.

otherArg(1,2...) = any other arguments that is needed in each template. 
```