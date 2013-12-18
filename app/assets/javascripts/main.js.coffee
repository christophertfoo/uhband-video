# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

angular.module('uhband', ['ngRoute', 'AddControllers', 'HomeControllers', 'SearchControllers'])
  .config(['$routeProvider', '$locationProvider', ($routeProvider) -> 
    # Angular Routes
    $routeProvider.when('/', { templateUrl: '../assets/home.html', controller: 'HomeCtrl' })
    $routeProvider.when('/add', { templateUrl: '../assets/addMedia.html', controller: 'AddCtrl' })
    $routeProvider.when('/search', { templateUrl: '../assets/search.html', controller: 'SearchCtrl' })
    $routeProvider.otherwise({ templateUrl: '../assets/404.html' })
])
