var apiService = angular.module("apiService", ["ngResource"]);

apiService.factory('Profile', function($resource) {
   return $resource("/profile.json", {}, {
      "update": { method: "PUT" }
   });
}).factory('Friend', function($resource) {
   return $resource('/friends/:Username.json', { Username: '@Username' }, {});
});
