@app = angular.module('app', [
  'restangular'
  'templates'
  'ng-rails-csrf'
])

# for compatibility with Rails CSRF protection

@app.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@app.run(->
  console.log 'angular app running'
)
