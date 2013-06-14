'use strict';

/* Controllers */

function DocListCtrl($scope, $http) {
	$http.get('js/_doc.json').success(function(data) {
	    $scope.docs = data;
	  });
	$scope.queryKey = function (key) {
		$scope.query = key;
	}
}