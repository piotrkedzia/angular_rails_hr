angular.module('ordersmaker').controller('CustomerEditModalCtrl', [
  '$scope', '$modalInstance', 'customer', 'Restangular', ($scope, $modalInstance, customer, Restangular)->

    $scope.customer = customer

    $scope.submitCustomer = (customer) ->
      if customer.id?
        customer.put().then(
          $modalInstance.close('saved')
        )
      else
        Restangular.setBaseUrl("/api")
        baseCustomers = Restangular.all('customers')
        baseCustomers.post(customer).then(
          $modalInstance.close('created')
        )
      console.log 'submit customer'

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
