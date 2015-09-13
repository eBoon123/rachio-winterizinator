###*
 # @ngdoc function
 # @name rachioWinterizinatorApp.controller:MainCtrl
 # @description
 # # MainCtrl
 # Controller of the rachioWinterizinatorApp
###


(->
  MainCtrl = (localStorageService)->
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
    return
  MainCtrl
    .$inject = ['localStorageService']
  angular
    .module('rachioWinterizinatorApp')
    .controller 'MainCtrl', MainCtrl
)()
