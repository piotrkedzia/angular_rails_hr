angular.module('ordersmaker').controller("OrderListCtrl", [
  '$scope', 'OrderService',
  ($scope, OrderService) ->

    OrderService.list().then((orders) ->
      $scope.orders = orders
      console.dir orders
    )

    $scope.fetch_line_items = (order) ->
      OrderService.line_items(order).then((line_items) ->
        $scope.line_items = line_items
        console.dir line_items
      )
])
