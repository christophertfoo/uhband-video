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
      element.typeahead({ local: if scope.field? then _.pluck(scope.data, scope.field) else scope.data })
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