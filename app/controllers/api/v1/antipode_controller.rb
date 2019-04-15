class Api::V1::AntipodeController < ApplicationController
  def show
    antipode = AntipodeCreator.create(params[:loc])
    render json: AntipodeSerializer.new(antipode)
  end
end
