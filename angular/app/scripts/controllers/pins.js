'use strict';

/**
 * @ngdoc function
 * @name angularApp.controller:PinsCtrl
 * @description
 * # PinsCtrl
 * Controller of the angularApp
 */

var app = angular.module('angularApp');

app.controller('PinsCtrl', ['$scope', 'Pin', function ($scope, Pin) {
  $scope.pins = Pin.query();

  $scope.changedValue = function (pin) {
    Pin.update({id: pin.id}, {pin: pin});
  };
}]);
