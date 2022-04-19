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

  context 'Iteration 2' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    it 'starts with no bids by default' do
      expect(@item1.bids).to eq({})
    end

    it 'can add bids' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end

    it 'can return the current highest offer' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end
  end

  context 'Iteration 3' do
    before(:each) do
      @item1 = Item.new('Chalkware Piggy Bank')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
    end

    it 'can close bidding' do
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)
      expect(@item1.bids).to eq({@attendee2 => 20, @attendee1 => 22})
    end
  end
end
