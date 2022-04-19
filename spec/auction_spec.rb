require "./lib/auction"
require "rspec"

RSpec.describe Auction do
  describe "Iteration 1" do
    it "exists" do
      auction = Auction.new
      expect(auction).to be_a Auction
    end

    it "has no items by default" do
      auction = Auction.new
      expect(auction.items).to eq []
    end
  end
end
