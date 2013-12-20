@HomeControllers = angular.module('HomeControllers', [])

@HomeControllers.controller('HomeCtrl', ['$scope', ($scope) ->
  
  $scope.feedLoading = true
  
  $scope.media_elements = []
    
  $scope.convertDate = (created_at) ->
    regex = /(\d+)-(\d+)-(\d+)T(\d+):(\d+):(\d+)\.(\d+)/
    matches = regex.exec(created_at)
    date = new Date(matches[1], parseInt(matches[2]) - 1, matches[3], matches[4], matches[5], matches[6], matches[7])
    date.toString()
 
  init = ->
    jQuery.get('/api/media.json').done((mediaData) ->
      _.each(mediaData, (data) -> 
        $scope.media_elements.push(data)
      )
      
      $scope.$apply()  
     )
     
  init()
])
