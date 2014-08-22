angular.module('app').directive 'cjSearch', ->
	return {
		restrict: 'E',
		templateUrl: 'searchDirective/cj-search-directive-template.html',
		scope: {
			searchText: '=',
			isSearching: '='
		},
		controller: ($scope) ->
			$scope.localSearchText = ''
			$scope.clearSearch = ->
				$scope.searchText = ''
				$scope.localSearchText = ''
			$scope.doSearch = ->
				$scope.searchText = $scope.localSearchText
		
	}