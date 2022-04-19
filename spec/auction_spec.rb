require './lib/attendee'
require './lib/auction'
require './lib/item'

RSpec.describe Auction do

  it 'exists' do
    auction = Auction.new
    expect(auction).to be_an_instance_of(Auction)
  end

  it 'has readable attributes' do
    auction = Auction.new
    expect(auction.items).to eq([])
  end

end
