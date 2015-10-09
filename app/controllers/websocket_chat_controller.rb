# WebsocketRails::BaseControllerを継承

class WebsocketChatController < WebsocketRails::BaseController

	before_filter :only => :new_message do
    puts "new_message was called"
  end

	def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end

  def connect_confirmation
  	broadcast_message(:confirmation, recieve_message)

  end

  # イベントをクライアントに送る
  def event_confirmation
  	recieve_message = message()
  	new_message = {:message => recieve_message}

  	# new_message = {:message => 'this is a message'}
		send_message :event_confirmation, new_message
  end

  def add_chat
  	recieve_message = message()
  	new_message = {:message => recieve_message}

  	# new_message = {:message => 'this is a message'}
		broadcast_message :add_chat, new_message
  end

end