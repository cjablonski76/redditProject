angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when '/',
			caption: 'Home',
			controller: 'homeController',
			templateUrl: 'home/home.html'
]