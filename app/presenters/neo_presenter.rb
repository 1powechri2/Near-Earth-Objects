class NeoPresenter
  def initialize(params)
    start_date = params[:start_date]
    end_date = params[:end_date]
    @nasa_neos = NeoService.new(start_date, end_date).neos
  end

  def neos
    nasa_neos_keys.map do |key|
      @nasa_neos[:near_earth_objects][key].map do |neo_data|
        NearEarthObject.new(neo_data)
      end
    end.flatten
  end

  def nasa_neos_keys
    @nasa_neos[:near_earth_objects].keys
  end
end
