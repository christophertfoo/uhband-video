@AddControllers = angular.module('AddControllers', ['videojs_helpers'])

@AddControllers.controller('AddCtrl', ['$scope', 'videojs', ($scope, videojs) ->
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
    
  $scope.tags = [{
    label : "Rainbow 2013",
    time : 0
  }, {
    label : "Marching Band",
    time : 0
  }, {
    label : "Trumpet Solo",
    time : 389.164
  }, {
    label : "Drum Break",
    time : 47.717
  }, {
    label : "Drum Break",
    time : 476.923
  }, {
    label : "Rainbow Closer",
    time : 606.649
  }];
  $scope.new_label = "";
  $scope.tag_search = "";
  $scope.selected_tag = "";

  $scope.makeTag = ->
    videoPlayer = jQuery('#vid1')[0].player;
    videoPlayer.pause();
    $scope.tags.push({
      label : $scope.new_label,
      time : videoPlayer.currentTime()
    });
    $scope.new_label = "";

  $scope.deleteTag = (tag) ->
        $scope.tags.splice($scope.tags.indexOf(tag), 1)

  $scope.goTo = (time) ->
    videoPlayer = jQuery('#vid1')[0].player
    videoPlayer.currentTime(time)
    videoPlayer.play()
])
