require './lib/item'

RSpec.describe Item do
  it 'exist' do
    item1 = Item.new('Chalkware Piggy Bank')
  expect(item1).to be_an_instance_of(Item)
  end

  it 'has readable attributes' do
    item1 = Item.new('Chalkware Piggy Bank')
  expect(item1.name).to eq('Chalkware Piggy Bank')
  end

  it 'can have bids' do
    item1 = Item.new('Chalkware Piggy Bank')
  expect(item1.bids).to eq({})
  end

  it 'can add bids to an item' do
    item1 = Item.new('Chalkware Piggy Bank')

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)

  expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
  end

end
