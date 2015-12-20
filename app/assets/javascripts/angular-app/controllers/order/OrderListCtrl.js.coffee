angular.module('ordersmaker').controller("OrderListCtrl", [
  '$scope', 'CustomerOrderService',
  ($scope, CustomerOrderService) ->

    CustomerOrderService.list().then((orders) ->
      $scope.orders = orders
      console.dir orders
    )
])
