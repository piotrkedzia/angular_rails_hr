angular.module('ordersmaker').controller("HeaderCtrl", [
  '$scope', '$location', ($scope, $location) ->
  
    $scope.is_active = (view_location) -> 
        view_location == $location.path()
])
