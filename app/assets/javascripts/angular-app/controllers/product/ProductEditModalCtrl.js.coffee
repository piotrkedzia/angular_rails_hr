angular.module('ordersmaker').controller('ProductEditModalCtrl', [
  '$scope', '$modalInstance', 'product', 'Restangular', ($scope, $modalInstance, product, Restangular)->

    $scope.product = product

    $scope.submitProduct = (product) ->
      if product.id?
        product.put().then(
          $modalInstance.close('saved')
        )
      else
        Restangular.setBaseUrl("/api")
        baseProducts = Restangular.all('products')
        baseProducts.post(product).then(
          $modalInstance.close('created')
        )
      console.log 'submit product'

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
