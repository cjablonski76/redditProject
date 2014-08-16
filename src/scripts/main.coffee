app = angular.module 'app', [
	'ngRoute'
]

app.config ['$routeProvider', ($routeProvider) -> 
	$routeProvider
		.when('/userComments',
				{
					templateUrl: 'views/userComments.html',
					controller: 'userController'
				})
		.otherwise {redirectTo: 'index.html'}
]