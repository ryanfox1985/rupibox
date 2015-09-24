'use strict';

describe('Controller: PinsCtrl', function () {

  // load the controller's module
  beforeEach(module('angularApp'));

  var PinsCtrl,
    scope;

  // Initialize the controller and a mock scope
  beforeEach(inject(function ($controller, $rootScope) {
    scope = $rootScope.$new();
    PinsCtrl = $controller('PinsCtrl', {
      $scope: scope
      // place here mocked dependencies
    });
  }));

  it('should attach a list of awesomeThings to the scope', function () {
    expect(PinsCtrl.awesomeThings.length).toBe(3);
  });
});
