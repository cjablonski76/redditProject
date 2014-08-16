(function() {
  app.controller('userController', [
    $scope, $http, function($scope, $http) {
      return $http.get('http://www.reddit.com/top/random').then(function(data) {
        return data;
      });
    }
  ]);

}).call(this);
