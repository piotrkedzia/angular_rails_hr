angular.module('ordersmaker').factory('CustomerService', [
  'Restangular', 'Customer',
  (Restangular, Customer) ->

    model = 'customers'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Customer)
    )

    list: () -> Restangular.all(model).getList()
])
