var CustomerApp = angular.module('CustomerApp', ['ngResource', 'ngRoute']).
    config(function ($routeProvider) {
        $routeProvider.
        when('/', {controller: CustomerListCtrl, templateUrl: 'CustomerList.html'}).
        otherwise({ redirectTo: '/' });
});

CustomerApp.factory('Customer', function ($resource) {
    return $resource('/api/CustomerApi/:id', { id: '@id' }, { update: { method: 'PUT' } });
});

var CustomerListCtrl = function ($scope, $location, Customer) {
    $scope.Customers = Customer.query();
    $scope.test = 'testing';
};