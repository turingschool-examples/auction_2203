require './lib/item'
require './lib/auction'
require './lib/attendee'

describe Attendee do
  let(:auction) { Auction.new }
  let(:item1) { Item.new('Chalkware Piggy Bank') }
  let(:item2) { Item.new('Bamboo Picture Frame') }
  let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }

  it "exists" do
    expect(attendee).to be_a Attendee
  end

  it "has attributes" do
    expect(attendee.name).to eq "Megan"
    expect(attendee.budget).to eq(50)
  end
end
