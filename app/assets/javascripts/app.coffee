livetags = angular.module('livetags',[
  'templates',
  'ngRoute',
  'controllers',
])

livetags.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
    .when('/',
      templateUrl: "index.html"
      controller: 'LiveTagsController'
    )
])

stuff = [
  {
    id: 1
    user_id: 2
    link_url: 'http://www.twitch.tv'
  },
  {
    id: 2
    user_id: 2
    link_url: 'http://www.twitch.tv'
  },
  {
    id: 3
    user_id: 2
    link_url: 'http://www.twitch.tv'
  },
  {
    id: 4
    user_id: 2
    link_url: 'http://www.twitch.tv'
  },
]

controllers = angular.module('controllers',[])
controllers.controller("LiveTagsController", [ '$scope', '$routeParams', '$location',
  ($scope, $routeParams, $location) ->
    $scope.search = (keywords)->
      $location.path("/").search('keywords', keywords)
      $scope.hide = !stuff.isEmpty
      if $routeParams.keywords
        keywords = $routeParams.keywords.toLowerCase()
        $scope.collection = stuff.filter (media)-> media.link_url.toLowerCase().indexOf(keywords) != -1
      else
        $scope.collection = stuff

])