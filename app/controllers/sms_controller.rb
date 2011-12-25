class SmsController < ApplicationController

  def in
    #test = JSON.parse(params)
    logger.info { "TEST: #{params[:sm]}"}
    #req = ActiveSupport::JSON.decode(params)
    #user = User.find_by_phone_number(params[:senderAddress])
    #incoming_message = Smsified::IncomingMessage.new params
    #incoming_message2 = Smsified::IncomingMessage.new req
    #logger.info { "SMS1: #{incoming_message}"}
    logger.info { "SMS2: #{params}"}
    #logger.info { "SMS Recieved  #{params[:sm][:inboundSMSMessage]}" }
    #logger.info { "Phone number: #{req['senderAddress']} with message #{req['message']}}"}
    logger.info { "As Params Phone number: #{params[:senderAddress]} with message #{params[:message]}"}
    #if user
    #  blip = user.blips.build(:message => params[:message])
    #        #flit.message = flit.message[0..140]
    #  blip.created_at = Time.now # HACK
    #  blip.save!
    #end
  end
  
end
