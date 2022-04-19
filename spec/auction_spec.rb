require './lib/item'
require './lib/attendee'
require './lib/auction'

RSpec.describe Auction do
  it 'exist' do
    auction = Auction.new
  expect(auction).to be_an_instance_of(Auction)
  end
end
