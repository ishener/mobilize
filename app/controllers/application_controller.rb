class ApplicationController < ActionController::API
  def say
    @message = Cow.new.say(params[:message])
  end
end
