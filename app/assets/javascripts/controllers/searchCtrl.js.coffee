@SearchControllers = angular.module('SearchControllers', [])

@SearchControllers.controller('SearchCtrl', ['$scope', ($scope) ->
  $scope.tags = [
    {
      name: 'Tag 1',
      id: 1
    },
    {
      name: 'Tag 2',
      id: 2
    },
    {
      name: 'Tag 3',
      id: 3
    },
    {
      name: 'Tag 4',
      id: 4
    }
  ]
  
  $scope.existing_tags = [{ 
    name : "Rainbow 2013",
    id : 1
  }, {
    name : "Marching Band",
    id : 2
  }, {
    name : "Trumpet Solo",
    id : 3
  }, {
    name : "Drum Break",
    id : 4
  }, {
    name : "Rainbow Closer",
    id : 5
  }];
  
  $scope.new_tag = ''
  
  tagFinder = (tag) ->
    tag.name == $scope.new_tag
  
  $scope.addTag = ->
    if $scope.new_tag? && $scope.new_tag.length > 0 && !_.find($scope.tags, tagFinder)
      found = _.find($scope.existing_tags, tagFinder)
      if found?
        $scope.tags.push(found)
])