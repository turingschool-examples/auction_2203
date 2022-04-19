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
end
