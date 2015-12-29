angular.module('ordersmaker').controller("OrderShowCtrl", [
  '$scope', 'OrderService', '$routeParams',
  ($scope, OrderService, $routeParams) ->

    order = { id: $routeParams.orderId }
    OrderService.line_items(order).then((line_items) ->
      $scope.line_items = line_items
      console.dir line_items
    )
])
