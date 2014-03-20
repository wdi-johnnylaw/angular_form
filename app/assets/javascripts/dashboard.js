// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
var service = angular.module("apiService", ["ngResource"]);

service.factory('Profile', function($resource) {
   return $resource("/profile.json", {}, {
      "update": { method: "PUT" }
   });
}).factory('Friend', function($resource) {
   return $resource('/friends/:Username.json', { Username: '@Username' }, {});
});

var myApp = angular.module('MyApp', ['apiService']);

myApp.directive('autoSubmit', function() {
   return function(scope, element, attrs) {
      element.bind('blur', function() {
         if(scope.hasChanged) {
            scope.submitChanges();
            scope.hasChanged = false;
         }
      }).bind('change', function() {
         scope.hasChanged = true;
      }).bind('keyup', function() {
         if(event.keyCode == 13) {
            setTimeout(function() { element.blur(), 0 });
         }
      }).bind('focus', function() {
         element.select();
      }).bind('mouseup', function() {
         return false;
      });
   };
});

myApp.controller('FriendsCtrl', ['$scope', 'Friend', function($scope, Friend) {
   $scope.friends = Friend.query();
   $scope.unfriend = function(index) {
      friend = $scope.friends.splice(index, 1)[0];
      friend.$remove(
         { 'Username': friend.username },
         null,
         function() {
            $scope.friends.splice(index, 0, friend);
         }
      );
   };
}])

myApp.controller('ProfileCtrl', ['$scope', 'Profile', function($scope, Profile) {
   $scope.profile = Profile.get();
   $scope.updateRouteId = {};

   $scope.submitChanges = function() {
      if($scope.hasChanged) {
         var input = event.target;
         $(input).animate({ opacity: '.5' }).next('span').show();
         $scope.profile.$update(
            {},
            function() { $(input).animate({ opacity: '1' }).next('span').hide(); },
            null
         );
      }
   };
}]);