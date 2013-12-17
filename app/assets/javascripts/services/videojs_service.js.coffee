@videojs_helpers = angular.module('videojs_helpers', [])

@videojs_helpers.factory('videojs', ->
  return {    
    player: -> jQuery('.video-js')[0].player,
    getCurrentTime: -> player.currentTime(),
    gotoTime: (time) -> player.currentTime(time),
    play: -> player.play(),
    setSrc: (url) -> player.src(url)
  }
)
