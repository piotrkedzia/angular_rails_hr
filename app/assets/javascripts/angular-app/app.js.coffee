@app = angular.module('ordersmaker', [
  'ngRoute'
  'templates'
  'ng-rails-csrf'
  'controllers'
])

@app.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "customers/index.html"
        controller: 'CustomersController'
      )
])

controllers = angular.module('controllers',[])
controllers.controller("CustomersController", ['$scope',
  ($scope)->
    $scope.title = "Hello world"
])


@app.run(->
  console.log 'angular app running'
)
