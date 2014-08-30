angular.module 'app'
	.directive 'cjSlider', ->
		return {
			restrict: 'E',
			templateUrl: 'sliderDirective/cj-slider-template.html',
			transclude: true,
			scope: {
				total: '=',
			},
			controller: ($scope) ->
				if !$scope.remaining?
					$scope.remaining = $scope.total
				if !$scope.sliders?
					$scope.sliders = []
				this.tryAddSlider = (slider) ->
					if $scope.remaining - +slider.min >= 0
						$scope.sliders.push slider
						$scope.remaining -= +slider.min
						return true
					false
				this.tryTakePoint = ->
					if $scope.remaining > 0
						$scope.remaining--
						return 1
					return 0
				this.tryGivePoint = ->
					if $scope.remaining < $scope.total
						$scope.remaining++
						return 1
					return 0
				this.remaining = -> $scope.remaining
				return
			link: (scope, element, attr) ->
				test = 2
				return
			
		}
	.directive 'cjSliderChild', ->
		isValid = (scope) ->
			return scope.current <= +scope.max || scope.current >= +scope.min

		return {
			restrict: 'E',
			require: '^cjSlider',
			templateUrl: 'sliderDirective/cj-slider-child-template.html',
			scope: {
				min: '@',
				max: '@'	
			},
			link: (scope, element, attr, masterCtrl) ->
				if !scope.current?
					scope.current = +scope.min
				if !masterCtrl.tryAddSlider(scope)
					element.remove()
					return
				scope.$watch ( ->
					masterCtrl.remaining()), (newVal, oldVal) ->
						scope.remaining = newVal
				scope.tryReceivePoint = ->
					if !isValid(scope) || !scope.canReceive(scope)
						return
					scope.current += masterCtrl.tryTakePoint()
				scope.tryGivePoint = ->
					if !isValid(scope) || !scope.canGive(scope)
						return
					scope.current -= masterCtrl.tryGivePoint()
				scope.canReceive = () ->
					return scope.current < +scope.max && scope.remaining > 0
				scope.canGive = () ->
					return scope.current > +scope.min

				return
		}
