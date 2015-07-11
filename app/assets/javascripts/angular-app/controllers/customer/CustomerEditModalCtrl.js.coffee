angular.module('ordersmaker').controller('CustomerEditModalCtrl', [
  '$scope', '$modalInstance', 'customer', 'CustomerService', ($scope, $modalInstance, customer, CustomerService)->

    $scope.customer = customer

    $scope.submitCustomer = (customer) ->

      if customer.id?
        CustomerService.update(customer).then(
          $modalInstance.close('saved')
        )
      else
        CustomerService.create(customer).then(() ->
          $modalInstance.close(customer)
        )

      console.log 'submit customer'

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
