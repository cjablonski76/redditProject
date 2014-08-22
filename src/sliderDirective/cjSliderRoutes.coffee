angular.module('app').config ['$routeProvider', ($routeProvider) ->
	$routeProvider
		.when '/slider',
			caption: 'slider',
			templateUrl: 'sliderDirective/cj-slider.html'
]