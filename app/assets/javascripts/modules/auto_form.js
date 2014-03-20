var autoFormModule = angular.module('autoForm', ['ngResource']);

autoFormModule.directive('autoSubmit', function() {
   return function(scope, element, attrs) {
      element.bind('blur', function() {
         if(scope.hasChanged) {
            $(element).next('span').show();
            scope[attrs.autoSubmit].$update(
               scope.updateRouteId || {},
               function() { $(element).next('span').hide(); },
               null
            );
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
