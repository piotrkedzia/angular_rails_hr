angular.module('ordersmaker').controller('ProductEditModalCtrl', [
  '$scope', '$modalInstance', 'product', 'ProductService', ($scope, $modalInstance, product, ProductService)->

    $scope.product = product 

    $scope.submitProduct = (product) ->
      error
      success
      $scope.errors = {}
      success = (result) ->
            $modalInstance.close('saved')
            console.log 'submit product'
            return $scope.product = {};
      error = (result) ->
        angular.forEach result.data.errors, (errors, field) ->
          $scope.eProd[field].$setValidity('server', false)
          $scope.errors[field] = errors.join(', ')
      
      if product.id?    
        ProductService.update(product).then(success, error)
      else
        ProductService.create(product).then(success, error)
        
    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
