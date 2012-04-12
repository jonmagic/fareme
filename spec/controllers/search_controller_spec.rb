require 'spec_helper'

describe SearchController do

  describe "GET 'index' with query" do
    it "returns http success" do
      FareSearch.stub(:new => mock(:as_json => {:foo => 'bar'}))
      get 'index', :query => "sbn to vrn may 15 to may 20", :format => 'json'
      response.should be_success
      hash = JSON.parse(response.body)
      hash['foo'].should == 'bar'
    end
  end

end
