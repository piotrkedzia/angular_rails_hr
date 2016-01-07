angular.module('ordersmaker').factory('OrderService',[
  'Restangular', 'Order', (Restangular, Order) ->

    model = 'orders'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Order)
    )

    baseOrders = Restangular.all('orders')

    list: () ->
      Restangular.all(model).getList()

    create: (order) ->
      baseOrders.post(order)

    update: (order) ->
      order.put()

    line_items: (order) ->
      line_items = Restangular.one(model, order.id).getList('line_items')

    show: (order_id) ->
      Restangular.one('orders', order_id).get()
])
