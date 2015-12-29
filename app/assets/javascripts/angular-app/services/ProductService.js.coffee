angular.module('ordersmaker').factory('ProductService', [
  'Restangular', 'Product',
  (Restangular, Product) ->

    model = 'products'
    Restangular.setBaseUrl("/api")
    Restangular.extendModel(model, (obj) ->
      angular.extend(obj, Product)
    )
    baseProducts = Restangular.all('products')

    list: () -> 
      Restangular.all(model).getList()
    
    create: (product) ->
      baseProducts.post(product)
      
    update: (product) ->
      product.put()
])
