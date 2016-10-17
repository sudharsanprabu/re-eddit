
angular.module('app')
.controller('homeController', ['$http', 'ngDialog', '$scope', function($http, ngDialog, $scope) {

	/**
	 * @name {Object} detailIndex
	 * @desc Holds the detailed info of the post selected by the user.
	 */
	$scope.detailIndex = null;

	/**
	 * @name {Boolean} isAtMain
	 * @desc Describes if the list view is currently being shown. 
	 */
	$scope.isAtMain = true;

	/**
	 * @name {Boolean} isFresh
	 * @desc Remains true if the user has not searched any subreddit during their current session.
	 */
	$scope.isFresh  = true;

	/**
	 * @name {Boolean} isLoading
	 * @desc Describes if the GET request to the api endpoint is still loading. 
	 */
	$scope.isLoading = false;

	/**
	 * @name {Array} posts
	 * @desc Holds the results from the api endpoint response.
	 */
	$scope.posts = null;

	/**
	 * @name {String} subreddit
	 * @desc Holds the name of the subreddit to search.
	 */
	$scope.subreddit = null;

	/**
	 * @function
	 * @name launchDetails
	 * @desc Changes the list view to the detailed view.
	 */
	$scope.launchDetails = function(index) {
		$scope.detailIndex = index;
		$scope.isAtMain = false;
	}

	/**
	 * @function
	 * @name submit
	 * @desc Launchs a get request for the subreddit specified in the search bar.
	 */
	$scope.submit = function() {
		$scope.isAtMain  = true;
		$scope.isLoading = true;
		$http({
			method: 'GET',
			url: '/' + $scope.subreddit
		}).then(function(successRes) {
			$scope.isFresh   = false;
			$scope.isLoading = false;
			$scope.posts     = successRes.data;
		}, function(failRes) {
			$scope.isFresh   = false;
			$scope.isLoading = false;
			$scope.posts     = null;
		});
	}

	/**
	 * @function
	 * @name switchView
	 * @desc Switches visibility of detailed view to list view and vice versa.
	 */
	$scope.switchView = function() {
		$scope.isAtMain = !$scope.isAtMain;
	}

}]);
