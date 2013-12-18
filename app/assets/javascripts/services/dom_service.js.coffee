@domService = angular.module('dom_helpers', [])

@domService.factory('dom', ->
  return {
    disable: (selector) ->
      jQuery(selector).prop('disabled', true)
      
    enable: (selector) ->
      jQuery(selector).prop('disabled', false)
      
    enableTypeahead: (selector, values) ->
      jQuery(selector).typeahead(values)
      
    remove: (selector) ->
      jQuery(selector).remove()
    
    load: (selector, url, callback) ->
      jQuery(selector).load(url, callback)
  }
)
