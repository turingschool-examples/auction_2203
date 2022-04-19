require 'rspec'
require './lib/item'

RSpec.describe Item do
  describe 'object' do
    before :each do
      @item1 = Item.new('Chalkware Piggy Bank')
    end

    it 'has a name' do
      expect(@item1.name).to eq 'Chalkware Piggy Bank'
    end

    it 'has bids' do
      expect(@item1.bids).to eq({})
    end
  end
end
