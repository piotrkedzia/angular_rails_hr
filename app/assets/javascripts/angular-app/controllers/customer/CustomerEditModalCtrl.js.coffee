angular.module('ordersmaker').controller('CustomerEditModalCtrl', [
  '$scope', '$modalInstance', 'customer', 'CustomerService',
  ($scope, $modalInstance, customer, CustomerService)->

    $scope.customer = customer

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')

    $scope.submitCustomer = (customer) ->
      success = (result) ->
        $modalInstance.close('saved')

      error = (result) ->
        angular.forEach result.data.errors, (errors, field) ->
          $scope.form[field].$setValidity('server', false)

          $scope.errors[field] = errors.join(', ')

      if customer.id?
        CustomerService.update(customer).then(success, error)
      else
        CustomerService.create(customer).then(success, error)
    ])
