class FareSearch
  def initialize(params)
    @search = KayakFares.new(params)
  end

  def as_json(options = {})
    @search.results
  end
end