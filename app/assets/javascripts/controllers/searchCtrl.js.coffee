@SearchControllers = angular.module('SearchControllers', ['ngRoute'])

@SearchControllers.controller('SearchCtrl', ['$scope', '$routeParams', ($scope, $routeParams) ->  
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
        
  $scope.removeTag = (tag) ->
    $scope.tags = _.reject($scope.tags, (other) -> tag.name == other.name)
    
  init = ->
    $scope.tags = []  
    $scope.existing_tags = [];
      
    $scope.new_tag = { name: '' }
      
    $scope.errors = {}
    _.each($routeParams.tag_id, (element, index, list) ->
      found = _.find($scope.existing_tags, (tag) -> tag.id == parseInt(element))
      if found?
        $scope.tags.push(found)
    )
    $scope.media_elements = []
    
  init()
])