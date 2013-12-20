#
# dom_service.js.coffee
#
# Author: Christopher Foo
#
# Helpers for manipulating the DOM.  This should
# be handled by directives at some point...
#

@domService = angular.module('DomHelpers', [])

@domService.factory('dom', ->
  {
    
    # Disable an element
    disable: (selector) ->
      jQuery(selector).prop('disabled', true)
      
    # Enable an element
    enable: (selector) ->
      jQuery(selector).prop('disabled', false)
      
    # Remove an element
    remove: (selector) ->
      jQuery(selector).remove()
    
    # Load an HTML partial from the given URL
    load: (selector, url, callback) ->
      jQuery(selector).load(url, callback)
  }
)
