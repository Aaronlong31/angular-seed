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
        var ss = input.replace(/\[|\]|\s+/g, '').split('/');
        var pathHtml = "";
        $.each(ss,function(){
            if(this!='')
                pathHtml += "/<a href='javascript:void(0);' class='key'>" + this + "</a>";
        });
        return pathHtml;
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