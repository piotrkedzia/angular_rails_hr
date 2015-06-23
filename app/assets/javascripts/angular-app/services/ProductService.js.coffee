angular.module('ordersmaker').factory('ProductService', [
  'Restangular', 'Product',
  (Restangular, Product) ->

    model = 'products'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Product)
    )

    list: () -> Restangular.all(model).getList()
])
