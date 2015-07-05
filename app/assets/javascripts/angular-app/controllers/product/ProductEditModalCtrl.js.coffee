angular.module('ordersmaker').controller('ProductEditModalCtrl', [
  '$scope', '$modalInstance', 'product', 'Restangular', ($scope, $modalInstance, product, Restangular)->


    $scope.product = product
    $scope.errors = {}

    $scope.submitProduct = (product) ->
      error
      success
      if product.id?.length and product.profit?.length and product.description?.length and product.price?.length and product.profit?.length
        product.put().then(  
          success = (result) ->
            $scope.product.unshift(result);
            return $scope.product = {};
            $modalInstance.close('saved')
            console.log 'submit product'
        )
      else
        error = (result) ->
          return angular.forEach result.data.errors, (errors, field) ->
            $scope.eProd[field].$setValidity 'server', false
            return $scope.errors[field] = errors.join(', ')
            Restangular.setBaseUrl("/api")
            baseProducts = Restangular.all('products')
            baseProducts.post(product).then(
              $modalInstance.close('created')
            )
      

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
