angular.module('app.employeeApp').controller('EmployeeEditModalCtrl', [
  '$scope', '$modalInstance', 'employee', 'Restangular', ($scope, $modalInstance, employee, Restangular)->

    $scope.employee = employee

    $scope.submitEmployee = (employee) ->
      if employee.id?
        employee.put().then(
          $modalInstance.close('saved')
        )
      else
        Restangular.setBaseUrl("/api")
        baseEmployees = Restangular.all('employees')
        baseEmployees.post(employee).then(
          $modalInstance.close('created')
        )
      console.log 'submit employee'

    $scope.cancel = ->
      $modalInstance.dismiss('cancel')
])
