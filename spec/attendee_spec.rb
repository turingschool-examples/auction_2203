require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Attendee do
  let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }

  it "exists" do
    expect(item1).to be_a Attendee
  end

  it "has attributes" do
    expect(item1.name).to eq "Brunch"
    expect(item1.participants).to eq({})
  end
end
