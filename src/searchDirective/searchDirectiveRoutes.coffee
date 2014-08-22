angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when '/search',
			caption: 'Search',
			templateUrl: 'searchDirective/cjSearch.html'
]