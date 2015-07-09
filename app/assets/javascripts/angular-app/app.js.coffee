@app = angular.module('ordersmaker', [
  'ngRoute'
  'templates'
  'ng-rails-csrf'
  'restangular'
  'ui.bootstrap'
])

@app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider.when('/', templateUrl: "customer/index.html", controller: 'CustomerListCtrl')
    $routeProvider.when('/orders', templateUrl: "order/index.html", controller: 'OrderListCtrl')

])

@app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/products',
        templateUrl: "product/index.html"
        controller: 'ProductListCtrl'
      )
])


@app.run(->
  console.log 'angular app running'
)
