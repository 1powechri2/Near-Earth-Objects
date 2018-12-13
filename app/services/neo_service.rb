class NeoService
  def initialize(start_date, end_date)
    @start_date = start_date
    @end_date = end_date
  end

  def neo_data
    conn = Faraday.new(url: "https://api.nasa.gov") do |faraday|
    faraday.adapter Faraday.default_adapter
    end

    @response ||= conn.get("/neo/rest/v1/feed?start_date=#{@start_date}&end_date=#{@end_date}&api_key=#{ENV['NASA_KEY']}")

    data = JSON.parse(@response.body, symbolize_names: true)
  end
end
