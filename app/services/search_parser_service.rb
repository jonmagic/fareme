class SearchParserService

  # Parses a string into from/to/depart/return values.
  #
  # query - string to parse
  #
  # Returns a hash
  def parse(query)
    @query = query
    {:from => from, :to => to, :depart => depart_date, :return => return_date}
  end

  # Regular expression used to parse query string.
  #
  # Returns an instance of Regexp
  def regex
    Regexp.new(/(...)\sto\s(...)\s(.*\s\d*)\sto\s(.*\s\d*)/i)
  end

  # Matches query against regex.
  #
  # Returns
  def data
    regex.match(@query)
  end

  # Airport code for the departure airport.
  #
  # Returns a string or nil
  def from
    data[1].upcase if data[1]
  end

  def to
    data[2].upcase if data[2]
  end

  def depart_date
    Chronic.parse(data[3]).strftime('%m/%d/%Y') if data[3]
  end

  def return_date
    Chronic.parse(data[4]).strftime('%m/%d/%Y') if data[4]
  end
end