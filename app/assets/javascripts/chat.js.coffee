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
  	console.log("confirmationイベントが発生しました: " + response.message)
  	return


	failure = (response) ->
  	console.log("confirmationイベント生成に失敗しました " + response.message)
  	return

	object_to_send = 
		data: 'test'

	# イベントの発生確認
	ws_rails.trigger('confirmation', object_to_send, success, failure)



	  # メッセージ受信時の処理

	ws_rails.bind "websocket_chat", (message) ->

		$("p").text = "hello"

		alert "hello"

		# message_li = document.createElement("li");

		# message_li.textContent = message;

		# document.getElementById("chat_area").appendChild(message_li);

		return




	# メッセージ送信時の処理

	$("#send").click ->

		# alert "Hi"
		# return

	  comment = $("#comment").val()

	  ws_rails.trigger "websocket_chat", comment

	  alert comment

	  return

	return




