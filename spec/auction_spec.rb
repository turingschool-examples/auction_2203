require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Auction do
  let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }

  it "exists" do
    expect(item1).to be_a Item
  end
end
