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
])