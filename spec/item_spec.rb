require './lib/item'

RSpec.describe do
  it 'exists and has attributes' do

    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')

  expect(item1).to be_a(Item)
  expect(item1.name).to eq('Chalkware Piggy Bank')
  end
end
