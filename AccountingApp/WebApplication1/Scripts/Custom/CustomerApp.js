var CustomerApp = angular.module('CustomerApp', ['ngResource', 'ngRoute']).
    config(function ($routeProvider) {
        $routeProvider.
        when('/', { controller: CustomerListCtrl, templateUrl: '../../Templates/CustomerList.html' }).
            when('/Form', { controller: CustomerCreateCtrl, templateUrl: '../../Templates/CustomerForm.html' }).
            when('/Form/:custid', { controller: CustomerEditCtrl, templateUrl: '../../Templates/CustomerForm.html' }).
        otherwise({ redirectTo: '/' });
});

CustomerApp.factory('Customer', function ($resource) {
    return $resource('/api/CustomerApi/:id', { id: '@id' }, { update: { method: 'PUT' } });
});

var CustomerListCtrl = function ($scope, $location, Customer) {
    $scope.Customers = Customer.query();
    $scope.test = 'testing';

    $scope.delete = function () {
        var custid = this.Customer.CustomerID;
        Customer.delete({ id: custid }, function () {
            $("#cust_" + custid).fadeOut();
        });
    };
};
var CustomerCreateCtrl = function ($scope, $location, Customer) {
    $scope.Customers = Customer.query();
    $scope.save = function () {
        Customer.save($scope.Customer, function () {
            $location.path('/');
        });
    };
};

var CustomerEditCtrl = function ($scope, $routeParams, $location, Customer) {
    $scope.Customer = Customer.get({ id: $routeParams.custid });

    $scope.save = function () {
        Customer.update({ id: $scope.Customer.CustomerID }, $scope.Customer, function () {
            $location.path('/');
        });
    };
};

