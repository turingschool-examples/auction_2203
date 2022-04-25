require './lib/item'
require './lib/auction'
require './lib/attendee'


let(:item1) { Item.new('Chalkware Piggy Bank') }
let(:item2) { Item.new('Bamboo Picture Frame') }
let(:attendee) { Attendee.new({name: 'Megan', budget: '$50'}) }
let(:auction) { Auction.new }

describe Item do
  it "exists" do
    expect(item1).to be_a Item
  end

  it "has attributes" do
    expect(item1.name).to eq('Chalkware Piggy Bank')
  end
end

describe Attendee do
  it "exists" do
    expect(attendee).to be_a Attendee
  end

  it "has attributes" do
    expect(attendee.name).to eq('Megan')
    expect(attendee.budget).to eq('$50')
  end
end

describe Auction do
  it "exists" do
    expect(auction).to be_a Auction
  end

  it "has attributes" do
    expect(auction.items).to eq []
  end

  it "can add items" do
    auction.add_item(item1)
    auction.add_item(item2)
    expect(auction.items).to eq [item1, item2]
  end
end
