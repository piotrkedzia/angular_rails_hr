@app = angular.module('ordersmaker', [
  'ngRoute'
  'templates'
  'ng-rails-csrf'
  'restangular'
  'ui.bootstrap'
])

@app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider.when('/customers', templateUrl: "customer/index.html", controller: 'CustomerListCtrl')
    $routeProvider.when('/orders/:orderId', templateUrl: "main/show.html", controller: "OrderShowCtrl")
    $routeProvider.when('/orders', templateUrl: "order/index.html", controller: 'OrderListCtrl')
    $routeProvider.when('/products', templateUrl: "product/index.html", controller: 'ProductListCtrl')
    $routeProvider.when('/', templateUrl: "main/show.html", controller: 'MainCtrl')
])

@app.run(->
  console.log 'angular app running'
)
