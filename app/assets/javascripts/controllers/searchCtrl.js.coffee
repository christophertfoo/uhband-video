@SearchControllers = angular.module('SearchControllers', ['ngRoute', 'DateConverter'])

@SearchControllers.controller('SearchCtrl', ['$scope', '$routeParams', 'date_converter', ($scope, $routeParams, date_converter) ->
  
  $scope.loading = true
    
  $scope.loadingFeed = false
  
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
    
  refreshResults = ->
      $scope.media_elements = []
      $scope.loadingFeet = true
      data = {
        tag_ids: _.pluck($scope.tags, 'id')
      }
      jQuery.get("/api/search", data).done((searchData) ->
        $scope.$apply( ->
          $scope.media_elements = searchData
          $scope.loadingFeed = false  
        )
      )
    
  tagFinder = (tag) ->
    tag.name == $scope.new_tag.name
  
  $scope.addTag = ->
    delete $scope.errors['add-tag']
    if $scope.new_tag.name.length == 0
      $scope.errors['add-tag'] = "Tag name cannot be empty."
    else if !_.find($scope.tags, tagFinder)
      found = _.find($scope.existing_tags, tagFinder)
      if found?
        $scope.tags.push(found)
      else
        $scope.errors['add-tag'] = "\"#{$scope.new_tag.name}\" is not a valid tag name."
    else
      $scope.errors['add-tag'] = "Already searching for \"#{$scope.new_tag.name}\"."
      
    $scope.new_tag.name = ''
    refreshResults()
        
  $scope.removeTag = (tag) ->
    $scope.tags = _.reject($scope.tags, (other) -> tag.name == other.name)
    refreshResults()
    
  init = ->
    $scope.tags = []  
    $scope.existing_tags = [];
    
    jQuery.get('/api/tags.json').done((tagData) ->

      _.each(tagData, (tag) ->
        $scope.existing_tags.push({ name: tag.label, id: tag.id })
      )
      
      $scope.new_tag = { name: '' }
    
      $scope.errors = {}
      _.each((if $routeParams.tag_id instanceof Array then $routeParams.tag_id else [$routeParams.tag_id]), (element, index, list) ->
        found = _.find($scope.existing_tags, (tag) -> tag.id == parseInt(element))
        if found?
          $scope.tags.push(found)
      )
      $scope.media_elements = []
      data = {
        tag_ids: _.pluck($scope.tags, 'id')
      }
      jQuery.get("/api/search", data).done((searchData) ->
        $scope.$apply( ->
          $scope.media_elements = searchData
          $scope.loading = false  
        )
      )
    )
    
  init()
])