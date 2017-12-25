{ Template } = require 'meteor/templating'
require './clusterize.tpl.jade'
Clusterize = require './clusterize-blaze.js'

Template.clusterize.onRendered ->
  @autorun =>
    data = Template.currentData();
    return if (!data)

    template = Template[data.template]
    list = data.data
    rowsInBlock = data.rowsInBlock
    blocksInCluster = data.blocksInCluster

    otherArgs = _.omit(data, ['template', 'data', 'rowsInBlock', 'blocksInCluster'])

    if @clusterize
      @clusterize.update(list)
    else
      @clusterize = new Clusterize
        rows: list,
        template: template,
        otherArgs: otherArgs,
        scrollId: 'scrollArea',
        contentId: 'contentArea',
        tag: 'div',
        rows_in_block: rowsInBlock,
        blocks_in_cluster: blocksInCluster,
        no_data_text: ''

