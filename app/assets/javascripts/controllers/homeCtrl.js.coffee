#
# homeCtrl.js.coffee
#
# Author: Christopher Foo
#
# The controller for the home page.
#
@HomeControllers = angular.module('HomeControllers', ['DateConverter'])

@HomeControllers.controller('HomeCtrl', ['$scope', 'date_converter', ($scope, date_converter) ->
  
  # If the feed is loading
  $scope.feedLoading = true
  
  # The media elements in the feed
  $scope.media_elements = []
    
  # Convert the given date from the database into a
  # nicer format.
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
 
  # Initializes the values of the controller
  init = ->
    
    # Load data for the feed
    jQuery.get('/api/media.json').done((mediaData) ->
      _.each(mediaData, (data) -> 
        $scope.media_elements.push(data)
      )      
      $scope.feedoading = false
      $scope.$apply()  
     )
 
  # Run the initialize function    
  init()
])
