class Api::V1::BaseController < ApplicationController
  protect_from_forgery with: :null_session

  def error_message
    { message: 'There was an error with your request' }
  end

  def favorite_created(location)
    { message: "You have favorited #{location}" }
  end

  def favorite_deleted(location)
    { message: "You have unfavorited #{location}" }
  end
end
