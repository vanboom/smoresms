require 'spec_helper'

describe SmoreSMS::SMS do
  it "should load the carriers yml file" do
    s = SmoreSMS::SMS.new
    expect(s.carriers.count).to eq 75
  end
  describe "validate carrier" do
    it "validates presence of carrier" do
      s = SmoreSMS::SMS.new
      s.valid?
      expect(s.errors[:carrier].count).to eq 2
    end
    it "validates carrier supported" do
      s = SmoreSMS::SMS.new(:number=>"1231231234", :carrier=>"blah")
      s.valid?
      expect(s.errors[:carrier]).to include "is not supported"
    end
    it "success case:  verizon" do
      s = SmoreSMS::SMS.new(:carrier=>"verizon")
      s.valid?
      expect(s.errors[:carrier].count).to eq 0
    end
    it "implements carrier_name" do
      s = SmoreSMS::SMS.new(:carrier=>"verizon")
      expect(s.carrier_name).to eq "Verizon Wireless"
    end
    it "implements recipient" do
      s = SmoreSMS::SMS.new(:carrier=>"verizon")
      expect(s.recipient).to eq [s.number,"vtext.com"].join("@")
    end
  end
  it "validates" do
    s = SmoreSMS::SMS.new(:number=>"123-123-1234", :carrier=>"verizon")
    expect(s).to be_valid
  end
  it "should format phone number" do
    s = SmoreSMS::SMS.new(:number=>nil, :carrier=>"blah")
    s.valid?
    expect(s.errors[:number].count).to eq 2
  end
end
