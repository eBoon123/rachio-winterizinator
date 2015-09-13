###*
 # @ngdoc overview
 # @name rachioWinterizinatorApp
 # @description
 # # rachioWinterizinatorApp
 #
 # Main module of the application.
###
angular
  .module 'rachioWinterizinatorApp', [
    'ngAnimate',
    'ngCookies',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch',
    'LocalStorageModule',
    'ngMdIcons'
  ]
  .config ($routeProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'views/main.html'
        controller: 'MainCtrl'
        controllerAs: 'main'
      .when '/manage/:rachioKey',
        templateUrl: 'views/manage.html'
        controller: 'MainManageCtrl'
        controllerAs: 'manage'
      .when '/about',
        templateUrl: 'views/about.html'
        controller: 'AboutCtrl'
        controllerAs: 'about'
      .otherwise
        redirectTo: '/'

