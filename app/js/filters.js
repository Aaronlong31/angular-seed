'use strict';

/* Filters */
angular.module('docFilters', []).filter('methodStyle', function(){
	return function(input){
		if (input == "GET") {
			return "btn-success";
		} else if (input == "POST") {
			return "btn-primary";
		} else if (input == "DELETE") {
			return "btn-danger";
		} else if (input == "PUT") {
			return "btn-warning";
		} else {
			return "";
		}
	}
}).filter('splitPath', function() {
	return function(input, scope) {
        return input.replace(/\[|\]|\s+/g, '').split('/').slice(1);
	}
}).filter('classToPath', function() {
	return function(input, scope) {
		return input.replace(/\./g, '/');
	}
}).filter('first', function(){
	return function(input, scope) {
		return input.split(/\s+/)[0];
	}
});