class SmsController < ApplicationController

  def in
    logger.info { "SMS Recieved #{request.body}" }
    incoming_message = Smsified::IncomingMessage.new request.body
    user = User.find_by_phone_number(params[:senderAddress])
    logger.info { "SMS Recieved  #{req}" }
    if user
      blip = user.blips.build(:message => params[:message])
            #flit.message = flit.message[0..140]
      blip.created_at = Time.now # HACK
      blip.save!
    end
  end
  
end
