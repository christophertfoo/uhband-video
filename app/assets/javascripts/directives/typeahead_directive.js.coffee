# 
# typeahead_directive.js.coffee
#
# Author: Christopher Foo
#
# Angular directive for the typeahead.js widget
#

@typeahead = angular.module('TypeaheadDirective', [])

@typeahead.directive('typeahead', ->
  {
    restrict: 'A',
    scope: {
      data: '=typeaheadData',
      field: '@typeaheadField'
      model: '=ngModel',
    },
    link: (scope, element, attrs) ->
      # Initialize the typeahead element
      element.typeahead({ local: if scope.field? then _.pluck(scope.data, scope.field) else scope.data })
      
      # Add event handlers to catch autocompletion / selection so that the associated model gets updated as well
      if scope.model?
        element.on('typeahead:selected', (e, datum) ->  
          scope.$apply(->
            scope.model = datum.value
          ))
        element.on('typeahead:autocompleted', (e, datum) ->
          scope.$apply(->
            scope.model = datum.value
          )
        )
  }  
)
