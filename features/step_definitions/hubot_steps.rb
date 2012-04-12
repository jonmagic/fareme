When /^hubot requests fares for "([^"]*)"$/ do |query|
  VCR.use_cassette "api/search?query=#{query}" do
    get "/api/search", :query => query, :format => 'json'
  end
end

Then /^hubot should get a successful response$/ do
  last_response.status.should == 200
end

Then /^hubot should receive an array of fares$/ do
  @fares = JSON.parse(last_response.body)
end

When /^hubot grabs fare number "([^"]*)"$/ do |number|
  @fare = @fares[number.to_i-1]
end

Then /^hubot should see "([^"]*)" under "([^"]*)"$/ do |value, key|
  @fare[key].should == value
end