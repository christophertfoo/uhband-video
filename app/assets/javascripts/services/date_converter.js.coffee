@date_converter = angular.module('DateConverter', [])

@date_converter.factory('date_converter', ->
  {
    convert: (created_at) ->
      regex = /(\d+)-(\d+)-(\d+)T(\d+):(\d+):(\d+)\.(\d+)/
      matches = regex.exec(created_at)
      date = new Date(matches[1], parseInt(matches[2]) - 1, matches[3], matches[4], matches[5], matches[6], matches[7])
      date.toString()
  }
)
