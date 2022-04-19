require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Item do
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }
  let(:auction) { Auction.new }

  it "exists" do
    expect(item1).to be_a Item
  end

  it "has attributes" do
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end
end
