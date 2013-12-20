#
# searchCtrl.js.coffee
#
# Author: Christpher Foo
#
# The controller for the search page.
#

@SearchControllers = angular.module('SearchControllers', ['ngRoute', 'DateConverter'])

@SearchControllers.controller('SearchCtrl', ['$scope', '$routeParams', 'date_converter', ($scope, $routeParams, date_converter) ->
  
  # If the whole page is loading data
  $scope.loading = true
    
  # If the feed is being loaded / refreshed
  $scope.loadingFeed = false
  
  # Converts the given date from the database into a nicer
  # format
  $scope.convertDate = (created_at) ->
    date_converter.convert(created_at)
    
  # Refreshes the feed results with the latest tags
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
  
  # Iterator for Underscore.js to find a tag by name
  tagFinder = (tag) ->
    tag.name == $scope.new_tag.name
  
  # Adds a new tag to the array of ones that we are searching for
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
      
  # Removes the given tag from the array of tags we are
  # searching for  
  $scope.removeTag = (tag) ->
    $scope.tags = _.reject($scope.tags, (other) -> tag.name == other.name)
    refreshResults()
    
  # Initializes the view and loads the data
  init = ->
    $scope.tags = []  
    $scope.existing_tags = [];
    
    # Get the tags
    jQuery.get('/api/tags.json').done((tagData) ->

      _.each(tagData, (tag) ->
        $scope.existing_tags.push({ name: tag.label, id: tag.id })
      )
      
      $scope.new_tag = { name: '' }
    
      $scope.errors = {}
      
      # Generate the parameters for the search query
      _.each((if $routeParams.tag_id instanceof Array then _.uniq($routeParams.tag_id) else [$routeParams.tag_id]), (element, index, list) ->
        found = _.find($scope.existing_tags, (tag) -> tag.id == parseInt(element))
        if found?
          $scope.tags.push(found)
      )
      $scope.media_elements = []
      data = {
        tag_ids: _.pluck($scope.tags, 'id')
      }
      
      # Fire the search query
      jQuery.get("/api/search", data).done((searchData) ->
        $scope.$apply( ->
          $scope.media_elements = searchData
          $scope.loading = false  
        )
      )
    )
    
  # Run the initialization function
  init()
])