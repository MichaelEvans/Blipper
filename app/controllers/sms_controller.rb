class SmsController < ApplicationController

  def in
    req = ActiveSupport::JSON.decode(request.body)
    #user = User.find_by_phone_number(params[:senderAddress])
    logger.info { "SMS Recieved  #{req}" }
    logger.info { "Phone number: #{req['senderAddress']} with message #{req['message']}}"}
    logger.info { "As Params Phone number: #{params[:senderAddress]} with message #{params[:message]}}"}
    if user
      blip = user.blips.build(:message => params[:message])
            #flit.message = flit.message[0..140]
      blip.created_at = Time.now # HACK
      blip.save!
    end
  end
  
end
