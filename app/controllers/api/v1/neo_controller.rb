class Api::V1::NeoController < ApplicationController
  def index
    render json: NeoPresenter.new(neo_params).neos
  end

private

  def neo_params
    params.permit(:start_date, :end_date, :sort, :filter)
  end
end
