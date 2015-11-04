#= require cable
#= require_self
#= require_tree .

@App = {}
App.cable = Cable.createConsumer "ws://#{window.location.host}/websocket"
