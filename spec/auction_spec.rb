require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  before :each do

    @auction = Auction.new
  end

  it "exists" do
    
    expect(@auction).to be_a(Auction)
  end

end
