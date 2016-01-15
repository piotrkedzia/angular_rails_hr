angular.module('ordersmaker').directive('elementHeightDirective', function($timeout) {
    return {
        restrict: 'A',
        link: function(scope, element) {

            var ready = function() {
                if (element.hasClass("products-container")) {
                    console.log("Inside ElementHeightDirective");
                    console.log(element[0].offsetHeight);
                    scope.products_table_height = element[0].offsetHeight -50;
                }
                
                if (element.hasClass("line-items-container")) {
                    console.log("Inside ElementHeightDirective");
                    console.log(element[0].offsetHeight);
                    scope.line_items_table_height = element[0].offsetHeight -50;
                }
            }
            $timeout(ready, 0);
        }
    };
  });