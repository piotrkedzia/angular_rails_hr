angular.module('ordersmaker').controller('ProductEditModalCtrl', [
  '$scope', '$modalInstance', 'product', 'Restangular', ($scope, $modalInstance, product, Restangular)->

    $scope.product = product 

    $scope.submitProduct = (product) ->
      error
      success
      $scope.errors = {}
      success = (result) ->
            $scope.product.unshift(result);
            return $scope.product = {};
            $modalInstance.close('saved')
            console.log 'submit product'
      
      error = (result) ->
        angular.forEach result.data.errors, (errors, field) ->
          $scope.eProd[field].$setValidity('server', false)
          $scope.errors[field] = errors.join(', ')
          

      product.put().then(success,error)
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
