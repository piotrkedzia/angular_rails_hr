angular.module('ordersmaker').controller("OrderShowCtrl", [
  '$scope', 'OrderService', 'ProductService', '$routeParams',
  ($scope, OrderService, ProductService, $routeParams) ->

    order = { id: $routeParams.orderId }
    OrderService.line_items(order).then((line_items) ->
      $scope.line_items = line_items
      console.dir line_items
    )
    ProductService.list().then((products) ->
      $scope.products = products
      console.dir products
    )
])
