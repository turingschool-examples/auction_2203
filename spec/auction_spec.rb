require 'rspec'
require './lib/attendee'
require './lib/item'
require './lib/auction'

describe Auction do
  it 'exists with attributes' do
    auction = Auction.new
    expect(auction).to be_a(Auction)
    expect(auction.items).to eq([])
  end
end
