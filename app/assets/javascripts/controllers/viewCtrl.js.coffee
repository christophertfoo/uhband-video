@ViewController = angular.module('ViewControllers', [ 'ngRoute', 'VideojsHelpers', 'DateConverter'])

@ViewController.controller('ViewCtrl', ['$scope', '$routeParams', '$location', 'videojs', 'date_converter', ($scope, $routeParams, $location, videojs, date_converter) ->
  $scope.successMessage = $routeParams.success
  $scope.loading = true
  
  $scope.$on '$locationChangeStart', (event, newVal, oldVal) ->
    if !$scope.loading && $scope.media.media_type == 'video'
      videojs.dispose()
  
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
    
  $scope.gotoTime = (tag) ->
    videojs.gotoTime(tag.timestamp)
    videojs.play()
    
  $scope.searchRelated = () ->
    tags = []
    _.each($scope.media.tags, (tag) ->
      tags.push(tag.id)
    )
    $location.path("/search").search('tag_id', tags)
  
  init = ->
    jQuery.get("/api/media/#{$routeParams.media_id}").done((data) ->
      $scope.$apply(->
        $scope.media = data      
        $scope.loading = false  
      )
      if $scope.media.media_type == 'video'
        videojs.initialize('vid1', $scope.media.path)
    )
  # Run initializer
  init()
])
