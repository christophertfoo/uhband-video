#
# addCtrl.js.coffee
#
# Author: Christopher Foo
#
# The controller for the add page.
#

@AddControllers = angular.module('AddControllers', ['videojs_helpers', 'dom_helpers'])

@AddControllers.controller('AddCtrl', ['$scope', '$http','videojs', 'dom', ($scope, $http, videojs, dom) ->  
  
  $scope.loading = true  
  $scope.loadFailed = false
  
  # Enable / disable things when the media type changes
  $scope.$watch('media.media_type', (newValue, oldValue) ->   

    if oldValue && oldValue.name == 'video' && $scope.mediaLoaded
      videojs.dispose()
      dom.load('#video-row', 'assets/video-partial.html', ->)
      $scope.mediaLoaded = false
  )
  
  # Reset vaulues when the user navigates away frm this page
  $scope.$on '$locationChangeStart', (event, newVal, oldVal) ->
    if $scope.mediaLoaded
      videojs.dispose()
      $scope.mediaLoaded= false
    $scope.media = {}
    $scope.new_tag.name = ''
    console.log(newVal, oldVal)
  
  # Loads the media at the given URL
  $scope.loadMedia = ->
    if $scope.media.url && $scope.media.url.length > 0
      if !$scope.mediaLoaded
        $scope.mediaLoaded = true
        videojs.initialize('vid1', $scope.media.url)
      else
        videojs.dispose()
        dom.load('#video-row', 'assets/video-partial.html', ->
          videojs.initialize('vid1', $scope.media.url)
        ) 

  # Creates a new tag
  $scope.makeTag = ->
    if $scope.isVideo()
      videojs.pause();
      
    $scope.tags.push({
      name : $scope.new_tag.name
      time : if $scope.isVideo() then videojs.getCurrentTime() else 0
    });
        
    $scope.new_tag.name = ''

  # Deletes a tag
  $scope.deleteTag = (tag) ->
        $scope.tags.splice($scope.tags.indexOf(tag), 1)

  # Makes the video player go to the specified time
  $scope.goTo = (time) ->
    videojs.gotoTime(time)
    videojs.play()
    
  # Determines if the current media element is a video or not
  $scope.isVideo = -> 
    $scope.media.media_type && $scope.media.media_type.name == 'video'
  
  $scope.submit = ->
    $scope.errors = {}
    if !$scope.media.title || $scope.media.title.length < 1
      $scope.errors['title'] = 'Title cannot be empty.'
    if !$scope.media.media_type
      $scope.errors['media_type'] = 'Must specify a media type.'
    if !$scope.media.desc || $scope.media.desc.length < 1
      $scope.errors['desc'] = 'Description cannot be empty.'
    if $scope.isVideo && (!$scope.media.url || $scope.media.url.length < 1)
      $scope.errors['url'] = 'URL cannot be empty'
      
    if $scope.errors.length == 0
      newTags = _.difference(_.pluck($scope.tags, 'name'), _.pluck($scope.existing_tags, 'name'))
      newTagPromises = []
      _.each(newTags, (tag) ->
        newTagPromises.push(jQuery.post('/api/tag', { label: tag }))
      )
      
      jQuery.when.apply(jQuery, newTagPromises).done( ->
        jQuery.when(jQuery.get('/api/tags.json')).done((tagData) ->
          $scope.existing_tags = []
          _.each(tagData[0], (tag) ->
            $scope.existing_tags.push({ name: tag.label, id: tag.id })
          )
        )
      )

  
  # Initialization function  
  init = ->    
    $scope.existing_tags = [];
    $scope.media_types = []  
    jQuery.when(
      jQuery.get('/api/tags.json')
      jQuery.get('/api/media_types.json')
    )
    .done((tagData, mediaTypeData) ->
       _.each(tagData[0], (tag) ->
         $scope.existing_tags.push({ name: tag.label, id: tag.id })
       )
       _.each(mediaTypeData[0], (mediaType) ->
         $scope.media_types.push({ name: mediaType.name, id: mediaType.id })
       )
       $scope.$apply(->
         $scope.new_tag = { name: '' }
         $scope.media = {}
         $scope.mediaLoaded = false
         $scope.tags = []  
         $scope.errors = {}
         $scope.loading = false
       )
    )
    .fail(->
      $scope.$apply(->
        $scope.loadFailed = true
      )
    )
     
  # Initialize the Controller
  init()
])
