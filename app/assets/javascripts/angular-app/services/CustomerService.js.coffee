angular.module('ordersmaker').factory('CustomerService', [
  'Restangular', 'Customer',
  (Restangular, Customer) ->

    model = 'customers'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Customer)
    )
    baseCustomers = Restangular.all('customers')

    list: () ->
      Restangular.all(model).getList()

    create: (customer) ->
      baseCustomers.post(customer)

    update: (customer) ->
      customer.put()
])
