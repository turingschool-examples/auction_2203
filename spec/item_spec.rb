require './lib/item'
require './lib/attendee'

RSpec.describe Item do
  let(:item1) {Item.new('Chalkware Piggy Bank')}
  let(:item2) {Item.new('Bamboo Picture Frame')}
  let(:attendee1) {Attendee.new({name: 'Megan', budget: '$50'})}
  let(:attendee2) {Attendee.new({name: 'Bob', budget: '$75'})}

  it "exists" do
    expect(item1).to be_a(Item)
    expect(item2).to be_a(Item)
  end

  it "has readable attributes" do
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item2.name).to eq('Bamboo Picture Frame')
    expect(item1.bids).to eq({})
  end

  it "can add a bid" do
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expected_hash = {attendee1 => 22,
                     attendee2 => 20}

    expect(item1.bids).to eq(expected_hash)
  end

  it "can return the current_high_bid" do
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    expect(item1.current_high_bid).to eq(22)

  end
  
end
