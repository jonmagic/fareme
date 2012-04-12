class FareMe
  def self.search_parser_service
    @search_parser_service ||= SearchParserService.new
  end
end