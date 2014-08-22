angular.module 'app'
	.directive 'cjSlider', ->
		return {
			restrict: 'E',
			templateUrl: 'sliderDirective/cj-slider-template.html',
			transclude: true,
			scope: {
				total: '=',
			},
			priority: 1,
			controller: ($scope) ->
				$scope.plus = ->
					$scope.total++
				$scope.minus = ->
					if $scope.total > 0
						$scope.total--
				return
			link: (scope, element, attr) ->
				test = 2
				return
			
		}
	.directive 'cjSliderChild', ->
		return {
			restrict: 'E',
			require: '^cjSlider',
			templateUrl: 'sliderDirective/cj-slider-child-template.html',
			scope: {
				onClick: '&'
			},
			link: (scope, element, attr) ->
				test = 2
				return
		}
