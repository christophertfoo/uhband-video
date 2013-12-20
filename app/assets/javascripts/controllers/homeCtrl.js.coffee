@HomeControllers = angular.module('HomeControllers', ['DateConverter'])

@HomeControllers.controller('HomeCtrl', ['$scope', 'date_converter', ($scope, date_converter) ->
  
  $scope.feedLoading = true
  
  $scope.media_elements = []
    
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
 
  init = ->
    jQuery.get('/api/media.json').done((mediaData) ->
      _.each(mediaData, (data) -> 
        $scope.media_elements.push(data)
      )
      
      $scope.$apply()  
     )
     
  init()
])
