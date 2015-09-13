'use strict'
###*
 # @ngdoc function
 # @name rachioWinterizinatorApp.controller:MainManageCtrl
 # @description
 # # MainManageCtrl
 # Controller of the rachioWinterizinatorApp
###


(->
  MainManageCtrl = ($routeParams, $http, $timeout, localStorageService)->
    vm = @
    vm.rachioKey = $routeParams.rachioKey
    vm.keyIsValid = true
    vm.personKey
    vm.rachioDeviceInfo
    # get person info, and validate api key
    $http.get('https://api.rach.io/1/public/person/info', {headers: {'Authorization': "Bearer #{vm.rachioKey}"}}).then (response) ->
      $timeout () ->
        data = response.data
        # alert data.id
        if response.status == 200
          localStorageService.set 'rachioApiKey', vm.rachioKey
          vm.keyIsValid = true
        else
          vm.KeyIsValid = false
        vm.personKey = data.id
        vm.personKey.$apply
        console.log vm.personKey
        vm.deviceInfo()
        
    vm.deviceInfo = () ->
      console.log "getting all devices info"
      $http.get("https://api.rach.io/1/public/person/#{vm.personKey}", {headers: {'Authorization': "Bearer #{vm.rachioKey}"}}).then (response) ->
        $timeout () ->
          console.log response.status
          data = response.data
          vm.rachioDeviceInfo = data.devices.concat(data.managedDevices)
          
    vm.allOff = (device) ->
      $http.put("https://api.rach.io/1/public/device/stop_water", {'id': device.id}, {headers: {'Authorization': "Bearer #{vm.rachioKey}"}}).then (response) ->
        console.log "stop all water request gave response #{response.status}, data #{response.data}"
        if response.status == 204
          zone.running = false for zone in device.zones
        
    vm.turnOn = (device, zone) ->
      $http.put("https://api.rach.io/1/public/zone/start", {'id': zone.id, 'duration': 60}, {headers: {'Authorization': "Bearer #{vm.rachioKey}"}}).then (response) ->
        if response.status == 204
          otherZone.running = false for otherZone in device.zones
          zone.running = true
          zone.requestProcessing = false
        console.log "start zone #{zone.zoneNumber} on device #{device.name} gave response #{response.status}, data #{response.data}"
      zone.requestProcessing = true
    return
    
    
  MainManageCtrl
    .$inject = ['$routeParams', '$http', '$timeout', 'localStorageService']
  angular
    .module('rachioWinterizinatorApp')
    .controller 'MainManageCtrl', MainManageCtrl
)()

