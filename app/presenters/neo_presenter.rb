class NeoPresenter
  def initialize(params)
    start_date = params[:start_date]
    end_date = params[:end_date]
    @sort = params[:sort]
    @nasa_neos = NeoService.new(start_date, end_date).neos
  end

  def neo_objects
    nasa_neos_keys.map do |key|
      @nasa_neos[:near_earth_objects][key].map do |neo_data|
        NearEarthObject.new(neo_data)
      end
    end.flatten
  end

  def nasa_neos_keys
    @nasa_neos[:near_earth_objects].keys
  end

  def neos
    if @sort != nil
      if @sort == 'miss_distance'
        neo_objects.sort_by do |object|
          object.send(@sort.to_s)
        end
      elsif @sort == 'diameter'
        neo_objects.sort_by do |object|
          object.send(@sort.to_s)[:estimated_diameter_max]
        end.reverse
      else
        neo_objects.sort_by do |object|
          object.send(@sort.to_s)
        end.reverse
      end
    else
      neo_objects
    end
  end
end
