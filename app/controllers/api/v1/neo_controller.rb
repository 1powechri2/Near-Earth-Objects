class Api::V1::NeoController < ApplicationController
  def index
    render_index
  end

private

  def neo_params
    params.permit(:start_date, :end_date, :sort, :filter)
  end

  def check_sort
    if neo_params[:sort] != nil
      if neo_params[:sort] == 'magnitude' || neo_params[:sort] == 'speed' || neo_params[:sort] == 'miss_distance' || neo_params[:sort] == 'diameter'
        render json: NeoPresenter.new(neo_params).neos
      else
        render json: {error: 'bad sort query'}, status: 400
      end
    else
      render json: NeoPresenter.new(neo_params).neos
    end
  end

  def render_index
    if neo_params[:filter] != nil
      if neo_params[:filter] == 'hazard'
        check_sort
      else
        render json: {error: 'filter query must = hazard'}, status: 400
      end
    else
      check_sort
    end
  end
end
