
angular.module('app')
.controller('homeController', ['$http', 'ngDialog', '$scope', function($http, ngDialog, $scope) {

	$scope.subreddit = null;

	$scope.posts = null;

	$scope.isAtMain = true;

	$scope.detailIndex = null;

	$scope.launchDetails = function(index) {
		$scope.detailIndex = index;
		$scope.isAtMain = false;
	}

	$scope.submit = function() {
		$scope.isAtMain = true;
		$http({
			method: 'GET',
			url: '/' + $scope.subreddit
		}).then(function(successRes) {
			$scope.posts = successRes.data;
			console.log(successRes.data);
		}, function(failRes) {
			$scope.posts = null;
		});
	}

	$scope.switchView = function() {
		$scope.isAtMain = !$scope.isAtMain;
	}

}]);
