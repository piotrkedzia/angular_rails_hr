angular.module('ordersmaker').controller("OrderShowCtrl", [
  '$scope', 'OrderService', 'ProductService', 'CustomerService', '$routeParams', 'Restangular',
  ($scope, OrderService, ProductService, CustomerService, $routeParams, Restangular) ->

    order_id = { id: $routeParams.orderId }

    OrderService.show(order_id.id).then((order) ->
      $scope.order = order
      console.dir $scope.order
    )
    OrderService.line_items(order_id).then((line_items) ->
      $scope.line_items = line_items
      console.dir line_items
    )

    ProductService.list().then((products) ->
      $scope.products = products
      console.dir products
    )
])
