@HomeControllers = angular.module('HomeControllers', [])

@HomeControllers.controller('HomeCtrl', ['$scope', ($scope) ->
    $scope.data = "TEST"
    
])
