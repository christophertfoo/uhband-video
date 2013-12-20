#
# viewCtrl.js.coffee
#
# Author: Christopher Foo
#
# The controller for the view media page.
#

@ViewController = angular.module('ViewControllers', [ 'ngRoute', 'VideojsHelpers', 'DateConverter'])

@ViewController.controller('ViewCtrl', ['$scope', '$routeParams', '$location', 'videojs', 'date_converter', ($scope, $routeParams, $location, videojs, date_converter) ->
  
  # If the success message should be shown
  $scope.successMessage = $routeParams.success
  
  # If the controller is loading data
  $scope.loading = true
  
  # Destroy the video when we navigate away from this page
  $scope.$on '$locationChangeStart', (event, newVal, oldVal) ->
    if !$scope.loading && $scope.media.media_type == 'video'
      videojs.dispose()
  
  # Converts the date from the database to a nicer format
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
    
  # Moves the video to the given time and plays it
  $scope.gotoTime = (time) ->
    videojs.gotoTime(time)
    videojs.play()
    
  # Navigates the user to a related search which
  # contains all of the tags that this media has
  $scope.searchRelated = () ->
    tags = []
    _.each($scope.media.tags, (tag) ->
      tags.push(tag.id)
    )
    $location.path("/search").search('tag_id', tags)
  
  # Initializes the view and loads the data
  init = ->
    jQuery.get("/api/media/#{$routeParams.media_id}").done((data) ->
      $scope.$apply(->
        $scope.media = data    
        if $scope.media.tags
          $scope.media.tags = _.sortBy($scope.media.tags, 'timestamp')  
        $scope.loading = false  
      )
      if $scope.media.media_type == 'video'
        videojs.initialize('vid1', $scope.media.path)
    )
    
  # Run initializer
  init()
])
