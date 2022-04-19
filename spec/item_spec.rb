require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do

  it "exists" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_an_instance_of(Item)
  end

  it "has readable attributes" do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it "can close bids" do
    item1 = Item.new('Chalkware Piggy Bank')

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

    item1.close_bidding

    item1.add_bid(attendee3, 70)

    expcected_hash = {attendee2 => 20, attendee1 => 22}
    expect(item1.bids).to eq(expcected_hash)
  end
end
