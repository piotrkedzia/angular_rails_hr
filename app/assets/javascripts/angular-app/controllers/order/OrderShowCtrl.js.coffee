angular.module('ordersmaker').controller("OrderShowCtrl", [
  '$scope', 'OrderService', 'ProductService', 'CustomerService', '$routeParams', 'Restangular',
  ($scope, OrderService, ProductService, CustomerService, $routeParams, Restangular) ->

    order_id = { id: $routeParams.orderId }
    $scope.products_table_height = 200
    $scope.line_items_table_height = 200
    $scope.current_image = ""
    
    OrderService.show(order_id.id).then((order) ->
      $scope.order = order
      console.dir $scope.order
      $scope.$apply
    )
    OrderService.line_items(order_id).then((line_items) ->
      $scope.line_items = line_items
      console.dir line_items
    )

    ProductService.list().then((products) ->
      $scope.products = products
      $scope.current_image = products[0].image_url
      console.dir products
      
    )
    
    $scope.$on('ui.layout.resize', (e, beforeContainer, afterContainer) ->
      $scope.line_items_table_height = afterContainer.size - 50
      $scope.products_table_height = beforeContainer.size - 50
      
    )
    $scope.setImage = (image_url)->
      $scope.current_image = image_url

])
