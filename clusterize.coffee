import { Mongo } from 'meteor/mongo'
import { Template } from 'meteor/templating'
import Clusterize from './clusterize-blaze.js'

import './clusterize.tpl.jade'

Template.clusterize.onRendered ->
  @autorun =>
    data = Template.currentData()
    if data.data instanceof Mongo.Collection.Cursor
      list = data.data.fetch()
      cacheTemplate = true
    else
      list = data.data
      cacheTemplate = false

    return unless (@clusterize || list?.length > 0)

    template = Template[data.template]
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
        initialScrollPosition: @data.initialScrollPosition || 0
        cacheTemplate: cacheTemplate

Template.clusterize.onDestroyed ->
  @clusterize.destroy(true) if @clusterize
