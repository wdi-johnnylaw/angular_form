// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var dashboardApp = angular.module('MyApp', ['apiService', 'autoForm']);

dashboardApp.controller('FriendsCtrl', ['$scope', 'Friend', function($scope, Friend) {
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

dashboardApp.controller('ProfileCtrl', ['$scope', 'Profile', function($scope, Profile) {
   $scope.profile = Profile.get();
}]);