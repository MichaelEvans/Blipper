class SmsController < ApplicationController

  def in
    req = ActiveSupport::JSON.decode(request.body)
    #user = User.find_by_phone_number(params[:senderAddress])
    #incoming_message = Smsified::IncomingMessage.new request
    incoming_message2 = Smsified::IncomingMessage.new request.body
    #logger.info { "SMS1: #{incoming_message['message']}"}
    logger.info { "SMS2: #{incoming_message2['message']}"}
    logger.info { "SMS Recieved  #{req}" }
    logger.info { "Phone number: #{req['senderAddress']} with message #{req['message']}}"}
    logger.info { "As Params Phone number: #{params[:senderAddress]} with message #{params[:message]}"}
    if user
      blip = user.blips.build(:message => params[:message])
            #flit.message = flit.message[0..140]
      blip.created_at = Time.now # HACK
      blip.save!
    end
  end
  
end
