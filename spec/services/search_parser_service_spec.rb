require 'spec_helper'

describe SearchParserService do
  subject     { SearchParserService.new }
  let(:query) { "sbn to vrn may 15 to may 20" }

  before do
    subject.parse(query)
  end

  describe "#parse" do
    context "with from/to/depart/return in standard formats" do
      it "returns hash with from/to/depart/return" do
        subject.parse(query).should == {
          :from   => "SBN",
          :to     => "VRN",
          :depart => "05/15/2012",
          :return => "05/20/2012"
        }
      end
    end
  end

  describe "#regex" do
    it "builds regular expression" do
      subject.regex.should == /(...)\sto\s(...)\s(.*\s\d*)\sto\s(.*\s\d*)/i
    end
  end

  describe "#data" do
    it "returns instance of MatchData" do
      subject.data.should be_instance_of(MatchData)
    end

    it "has 5 matches" do
      subject.data.length.should == 5
    end
  end

  describe "#from" do
    it "returns airport code if present" do
      subject.from.should == "SBN"
    end

    it "returns nil if not present" do
      subject.stub(:data => {})
      subject.from.should be_nil
    end
  end

  describe "#to" do
    it "returns airport code if present" do
      subject.to.should == "VRN"
    end

    it "returns nil if not present" do
      subject.stub(:data => {})
      subject.to.should be_nil
    end
  end

  describe "#depart_date" do
    it "returns date as string if present" do
      subject.depart_date.should == "05/15/2012"
    end

    it "returns nil if not present" do
      subject.stub(:data => {})
      subject.depart_date.should be_nil
    end
  end

  describe "#return_date" do
    it "returns date as string if present" do
      subject.return_date.should == "05/20/2012"
    end

    it "returns nil if not present" do
      subject.stub(:data => {})
      subject.return_date.should be_nil
    end
  end
end