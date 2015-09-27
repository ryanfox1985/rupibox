'use strict';

/**
 * @ngdoc overview
 * @name angularApp
 * @description
 * # angularApp
 *
 * Main module of the application.
 */
var app = angular.module('angularApp', [
  'ngAnimate',
  'ngAria',
  'ngCookies',
  'ngMessages',
  'ngResource',
  'ngRoute',
  'ngSanitize',
  'ngTouch',
  'xeditable'
]);

app.config(function ($routeProvider) {
  $routeProvider
    .when('/', {
      templateUrl: 'views/pins.html',
      controller: 'PinsCtrl',
      controllerAs: 'pins'
    })
    .when('/about', {
      templateUrl: 'views/about.html',
      controller: 'AboutCtrl',
      controllerAs: 'about'
    })
    .otherwise({
      redirectTo: '/'
    });
});

app.factory("Pin", function ($resource) {
  return $resource("/pins/:id.json", {id: "@id"},
    {
      'create': {method: 'POST'},
      'index': {method: 'GET', isArray: true},
      'show': {method: 'GET', isArray: false},
      'update': {method: 'PUT'},
      'destroy': {method: 'DELETE'}
    }
  );
});

app.run(['$rootScope', '$location', function($rootScope, $location){
  var path = function() { return $location.path();};
  $rootScope.$watch(path, function(newVal, oldVal){
    $rootScope.activetab = newVal;
  });
}]);

app.directive('bootstrapSwitch', [
  function() {
    return {
      restrict: 'A',
      require: '?ngModel',
      link: function(scope, element, attrs, ngModel) {
        element.bootstrapSwitch();

        element.on('switchChange.bootstrapSwitch', function(event, state) {
          if (ngModel) {
            scope.$apply(function() {
              ngModel.$setViewValue(state);
            });
          }
        });

        scope.$watch(attrs.ngModel, function(newValue) {
          if (newValue) {
            element.bootstrapSwitch('state', true, true);
          } else {
            element.bootstrapSwitch('state', false, true);
          }
        });
      }
    };
  }
]);

app.run(function(editableOptions) {
  editableOptions.theme = 'bs3'; // bootstrap3 theme. Can be also 'bs2', 'default'
});
