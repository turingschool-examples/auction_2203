require 'rspec'
require './lib/item'

describe Item do
  it 'exists with attributes' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_a(Item)
    expect(item1.name).to eq('Chalkware Piggy Bank')
    expect(item1.bids).to eq({})
  end

  it 'can add bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
    expect(item1.bids).to eq({})
    item1.add_bid(attendee2, 20)
    expect(item1.bids).to eq({ attendee2 => 20 })
  end

  it 'can give current high bid' do
    item1 = Item.new('Chalkware Piggy Bank')
    attendee1 = Attendee.new({ name: 'Megan', budget: '$50' })
    attendee2 = Attendee.new({ name: 'Bob', budget: '$75' })
    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expect(item1.current_high_bid).to eq(22)
  end
end
