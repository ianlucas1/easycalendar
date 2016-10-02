class MessagesController < ApplicationController 
 skip_before_filter :verify_authenticity_token
 # skip_before_filter :authenticate_user!, :only => "reply"

  def reply
    @message_body = params["Body"]
    @from_number = params["From"]
    boot_twilio
    sms = @client.messages.create(
      from: Rails.application.secrets.twilio_number,
      to: @from_number,
      body: reply_message
    )
  end
 
  private
 
  def boot_twilio
    account_sid = Rails.application.secrets.twilio_sid
    auth_token = Rails.application.secrets.twilio_token
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def reply_message
    if @message_body == "Y"
      appt_confirmation
    else
      welcome_msg
    end
  end

  def appt_confirmation
    return "Great, you have booked that appointment. We've notified your coach for you."
  end

  def welcome_msg
    return "Welcome to Easy Calendar#{reply_recipient}! Your number, #{@from_number}, also serves as your username."
  end

  def reply_recipient
    if @from_number == "+14785424512"
      return ", Ian"
    else
      return ""
    end
  end

end
