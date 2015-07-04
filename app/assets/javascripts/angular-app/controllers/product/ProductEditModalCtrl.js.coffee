angular.module('ordersmaker').controller('ProductEditModalCtrl', [
  '$scope', '$modalInstance', 'product', 'Restangular', ($scope, $modalInstance, product, Restangular)->


    $scope.product = product
    $scope.errors = {}

    $scope.submitProduct = (product) ->
      error
      success
      debugger
      if product.id?
        product.put().then(
          $modalInstance.close('saved')
          success = (result) ->
            $scope.product.unshift(result);
            return $scope.product = {};
      

          error = (result) ->
            return angular.forEach result.data.errors, (errors, field) ->
              $scope.yourForm[field].$setValidity 'server', false
              return $scope.errors[field] = errors.join(', ')
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
