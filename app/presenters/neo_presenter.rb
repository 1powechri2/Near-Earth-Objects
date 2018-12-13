class NeoPresenter
  def initialize(params)
    start_date = params[:start_date]
    end_date = params[:end_date]
    @nasa_neos = NeoService.new(start_date, end_date).neo_data
  end

  def neos
    @nasa_neos[:near_earth_objects].keys
  end
end
