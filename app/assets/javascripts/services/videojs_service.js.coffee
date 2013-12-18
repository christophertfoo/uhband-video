@videojs_helpers = angular.module('videojs_helpers', [])

@videojs_helpers.factory('videojs', ->
  techOrderArray = ["youtube"]
  return {    
    player: -> 
      jQuery('.video-js')[0].player
      
    initialize: (id, url) ->
      videojs(id, {'techOrder' : techOrderArray, 'src' : url })
      
    getCurrentTime: ->
       @player().currentTime()
       
    gotoTime: (time) ->
       @player().currentTime(time)
       
    play: ->
       @player().play()
       
    pause: ->
       @player().pause()
       
    setSrc: (url) -> 
      @player().src(url)
      
    dispose: ->
      @player().dispose()
  }
)
