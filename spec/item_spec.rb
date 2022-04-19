require './lib/item'
require 'Rspec'

describe Item do
  context 'Iteration 1' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
    end
    it 'exists' do
      expect(@item1).to be_an_instance_of(Item)
    end
    it 'has a readable name' do
      expect(@item1.name).to eq('Chalkware Piggy Bank')
    end
  end
end
