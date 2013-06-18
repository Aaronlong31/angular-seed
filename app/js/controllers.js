'use strict';

/* Controllers */

function DocListCtrl($scope, $http, $location) {
	$http.get('js/_doc.json').success(function(data) {
	    $scope.docs = data;
	  });
	$scope.query = $location.path().replace(/\//, '');
	$scope.filterKeyword = function (keyword, $event) {
		$scope.query = keyword;
		$event.stopPropagation();
	}
}