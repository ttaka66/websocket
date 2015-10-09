# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
	ws_rails = new WebSocketRails("192.168.33.10:3000/websocket")

	# 接続確認関数
	ws_rails.on_open = (data) ->
  	console.log('Websocketの接続ができました: ', data)
  	return

  success = (response) ->
  	console.log("event_confirmationイベントが発生しました: " + response.message)
  	return


	failure = (response) ->
  	console.log("event_confirmationイベント生成に失敗しました " + response.message)
  	return

	object_to_send = 
		data: 'test'

	# イベントの起動確認
	ws_rails.trigger('event_confirmation', object_to_send, success, failure)

	# イベントの発生確認
	ws_rails.bind 'event_confirmation', (data) ->
  	console.log(data.message) # would output 'this is a message'
  	return

  # メッセージ送信時の処理

	$("#send").click ->

		# alert "Hi"
		# return

	  comment = $("#comment").val()

	  ws_rails.trigger('add_chat', comment)

	  alert comment

	  return

	# メッセージ受信時の処理
	ws_rails.bind 'add_chat', (data) ->
  	console.log(data.message) # would output 'this is a message'
  	li = $('<li>').prepend(data.message)
  	$('#chat_area').prepend(li)
  	return

	return




