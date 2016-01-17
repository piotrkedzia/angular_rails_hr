angular.module('ordersmaker').controller("ProductListCtrl", [
  '$scope', 'ProductService', '$modal',
  ($scope, ProductService, $modal)->

    $scope.editProduct = (product) ->
      modalInstance = $modal.open({
        templateUrl: 'product/edit.html',
        controller: 'ProductEditModalCtrl'
        size: 'md'
        resolve:
          product: ->
            product
      })

      modalInstance.result.then(->
        console.log 'edit closed'
      )

    ProductService.list().then((products) ->
      $scope.products= products
      console.dir products
    )
])
