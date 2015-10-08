# WebsocketRails::BaseControllerを継承

class WebsocketChatController < WebsocketRails::BaseController

	def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def message_recieve



　　# クライアントからのメッセージを取得

　　recieve_message = message()



　　# websocket_chatイベントで接続しているクライアントにブロードキャスト

　　broadcast_message(:websocket_chat, recieve_message)

  end

  def connect_confirmation
  	broadcast_message(:confirmation, recieve_message)

  end

  # イベントをクライアントに送る
  # def new_message
  # 	new_message = {:message => 'this is a message'}
		# send_message :new_message, new_message
  # end

end