class NeoPresenter
  def initialize(params)
    start_date = params[:start_date]
    end_date = params[:end_date]
    @sort = params[:sort]
    @filter = params[:filter]
    @nasa_neos = NeoService.new(start_date, end_date).neos
  end

  def nasa_neos_keys
    @nasa_neos[:near_earth_objects].keys
  end

  def neo_objects
    nasa_neos_keys.map do |key|
      @nasa_neos[:near_earth_objects][key].map do |neo_data|
        NearEarthObject.new(neo_data)
      end
    end.flatten
  end

  def neos
    if @filter != nil
      neos_sorted.select do |neo|
        neo.send(@filter.to_s) == true
      end
    else
      neos_sorted
    end
  end

  def neos_sorted
    if @sort != nil
      if @sort == 'miss_distance'
        sort_distance
      elsif @sort == 'diameter'
        sort_diameter
      else
        sort_speed_or_magnitude
      end
    else
      neo_objects
    end
  end

  def sort_distance
    neo_objects.sort_by do |object|
      object.send(@sort.to_s)
    end
  end

  def sort_diameter
    neo_objects.sort_by do |object|
      object.send(@sort.to_s)[:estimated_diameter_max]
    end.reverse
  end

  def sort_speed_or_magnitude
    neo_objects.sort_by do |object|
      object.send(@sort.to_s)
    end.reverse
  end
end
