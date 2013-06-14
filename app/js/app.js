'use strict';


// Declare app level module which depends on filters, and services
/*
angular.module('liba-doc-app', ['docFilters']).
  config(['$routeProvider', function($routeProvider) {
    $routeProvider.when('/docs', {templateUrl: 'partials/list.html', controller: DocListCtrl});
    $routeProvider.when('/:docId', {templateUrl: 'partials/detail.html', controller: DocDetailCtrl});
    $routeProvider.otherwise({redirectTo: '/docs'});
  }]);
  */
angular.module('liba-doc-app',['docFilters']);