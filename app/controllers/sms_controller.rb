class SmsController < ApplicationController

  def in
    #test = JSON.parse(params)
    sm = params[:sm]
    ismn = sm[:inboundSMSMessageNotification]
    ism = ismn[:inboundSMSMessage]
    message = ism[:message]
    sender = ism[:senderAddress]
    number = sender[6..-1]
    logger.info { "Incoming SMS: #{message} from #{sender}"}
    #logger.info { "As Params Phone number: #{params[:senderAddress]} with message #{params[:message]}"}
    user = User.find_by_phone_number(number)
    if user
      blip = user.blips.build(:message => params[:message])
    #        #flit.message = flit.message[0..140]
      blip.created_at = Time.now # HACK
      blip.save!
    end
  end
  
end
