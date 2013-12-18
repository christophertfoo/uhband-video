@HomeControllers = angular.module('HomeControllers', [])

@HomeControllers.controller('HomeCtrl', ['$scope', ($scope) ->
    $scope.media_elements = [
      {
        mediaId: 1,
        title: "Test",
        media_type:"video",
        desc:"Test Description",
        creation_date: {
          month: 12,
          day: 17,
          year: 2013,
          hour: 21,
          minute: 28,
          second: 59 
        }
      }
    ]
    
    $scope.convertDate = (dateJson) ->
      date = new Date(dateJson.year, dateJson.month, dateJson.day, dateJson.hour, dateJson.minute, dateJson.second, 0)
      date.toString()
      
])
