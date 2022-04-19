require './lib/auction'
require 'Rspec'

describe Auction do
  context 'Iteration 1' do
    before(:each) do
    @auction = Auction.new
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    end

    it 'exists' do
      expect(@auction).to be_an_instance_of(Auction)
    end

    it 'has readable attributes' do
      expect(@auction.items).to eq([])
    end

    it 'can add items to auction' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.items).to eq([@item1, @item2])
    end

    it 'can return a list of names for items help in it' do
      @auction.add_item(@item1)
      @auction.add_item(@item2)
      expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
    end
  end
end
