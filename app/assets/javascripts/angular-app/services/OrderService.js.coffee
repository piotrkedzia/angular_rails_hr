angular.module('ordersmaker').factory('CustomerOrderService',[
  'Restangular', 'Order', (Restangular, Order) ->

    model = 'orders'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Order)
    )

    baseOrders = Restangular.all('orders')

    list: () ->
      Restangular.all(model).getList()
])
