#
# videojs_service.js.coffee
#
# Author: Christopher Foo
#
# Helpers to manipulate the VideoJS player.  This should
# Probably be moved to a directive at some point...
#

@videojs_helpers = angular.module('videojs_helpers', [])

@videojs_helpers.factory('videojs', ->
  techOrderArray = ["youtube"]
  return {    
  
    # Finds the player on the page
    player: -> 
      jQuery('.video-js')[0].player
      
    # Initialize the player with the given id to play the given url
    initialize: (id, url) ->
      videojs(id, {'techOrder' : techOrderArray, 'src' : url })
      
    # Gets the current time of the player
    getCurrentTime: ->
       @player().currentTime()
       
    # Sets the player to start at the given time
    gotoTime: (time) ->
       @player().currentTime(time)
    
    # Start playing the video
    play: ->
       @player().play()
       
    # Pause the video
    pause: ->
       @player().pause()
    
    # Change the video that is being played
    setSrc: (url) -> 
      @player().src(url)
      
    # Destroy the player
    dispose: ->
      @player().dispose()
  }
)
