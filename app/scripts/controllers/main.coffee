###*
 # @ngdoc function
 # @name rachioWinterizinatorApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rachioWinterizinatorApp
###


(->
  MainCtrl = ($location, localStorageService)->
    vm = @
    vm.apiKey = localStorageService.get('rachioApiKey')
    vm.awesomeThings = [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
    ]
    vm.update = (newApiKey) ->
      vm.apiKey = newApiKey
      alert(vm.apiKey)
    vm.authorize = () ->
      $location.path("/manage/#{vm.apiKey}")
    return
  MainCtrl
    .$inject = ['$location', 'localStorageService']
  angular
    .module('rachioWinterizinatorApp')
    .controller 'MainCtrl', MainCtrl
)()
