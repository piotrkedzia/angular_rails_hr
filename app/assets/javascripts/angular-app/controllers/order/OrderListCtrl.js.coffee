angular.module('ordersmaker').controller("OrderListCtrl", [
  '$scope', ($scope)->
    orders = [{ id: 1, description: "Order one" },
              { id: 2, description: "Super order" },
              { id: 3, description: "Cool order" } ]

    $scope.orders = orders
])
