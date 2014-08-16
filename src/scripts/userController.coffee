angular.module('app').controller 'userController', ['$scope', '$http',
	($scope, $http) ->
		$scope.comment = 'this is the comment'
		# $http.get('http://www.reddit.com/top/random').then (data) ->
		# 	data
]