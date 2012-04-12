class SearchController < ApplicationController
  respond_to :json

  # GET /api/search
  def index
    search_params = FareMe.search_parser_service.parse(params[:query])
    results = FareSearch.new(search_params)
    respond_with(results)
  end
end
