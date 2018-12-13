class NearEarthObject
  attr_reader :name, :magnitude, :diameter, :date,
              :speed, :miss_distance, :hazard, :sentry_object

  def initialize(data)
    @name = data[:name]
    @magnitude = data[:absolute_magnitude_h]
    @diameter = data[:estimated_diameter][:miles]
    @date = data[:close_approach_data].first[:close_approach_date]
    @speed = data[:close_approach_data].first[:relative_velocity][:miles_per_hour]
    @miss_distance = data[:close_approach_data].first[:miss_distance][:miles]
    @hazard = data[:is_potentially_hazardous_asteroid]
    @sentry_object = data[:is_sentry_object]
  end
end
