
angular.module('app', ['ngDialog', 'ngRoute'])
.config(function($routeProvider) {

	$routeProvider.when('/', {
		templateUrl: '/pages/home/index.html'
	})
	.otherwise({redirectTo: '/'});

})

