angular.module('app').controller 'cjSearchController', ['$scope', '$timeout',
	($scope, $timeout) ->
		$scope.$watch 'citySearchText', (citySearchText) ->
			$scope.citySearchResultss = []
			if citySearchText
				$scope.isSearchingForCities = true
				$timeout -> 
						$scope.isSearchingForCities = false
						$scope.citySearchResultss = ['Pekin', 'Chicago', 'Tremont']
						return
					, 1000
			else
				$scope.isSearchingForCities = false
]