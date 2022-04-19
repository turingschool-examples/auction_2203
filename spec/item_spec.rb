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
    expect(item1).to be_an_instance_of(Item)
  end
end
