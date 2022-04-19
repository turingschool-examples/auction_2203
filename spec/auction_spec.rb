require "./lib/auction"
require "rspec"

RSpec.describe Auction do
  describe "Iteration 1" do
    it "exists" do
      auction = Auction.new
      expect(auction).to be_a Auction
    end
  end
end
