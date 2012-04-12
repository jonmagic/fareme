require 'spec_helper'

describe FareSearch do
  it "does search with params" do
    params = mock(:params)
    KayakFares.should_receive(:new).with(params)
    FareSearch.new(params)
  end
end