angular.module('app').controller 'userController', ['$scope', '$http',
	($scope, $http) ->
		$http.get('http://www.reddit.com/top/random').then (data) ->
			data
]