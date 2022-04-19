require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do

  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')

  end

  it "exists and has attributes" do
    expect(@item1).to be_an(Item)
    expect(@item1.name).to eq('Chalkware Piggy Bank')
  end

  describe 'iteration 2'do
    before :each do
      @auction = Auction.new
      @item1 = Item.new('Chalkware Piggy Bank')
      @item2 = Item.new('Bamboo Picture Frame')
      @item3 = Item.new('Homemade Chocolate Chip Cookies')
      @item4 = Item.new('2 Days Dogsitting')
      @item5 = Item.new('Forever Stamps')
      @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    end

    it "see bids" do
      expect(@item1.bids).to eq({})
    end

    it "can add bids" do
      @item1.add_bids(@attendee2, 22)
      @item1.add_bids(@attendee1, 20)
      expect(@item1.bids).to eq({@attendee2 => 22,
        @attendee1 => 20})
    end

    it "can return the highest bid" do
      @item1.add_bids(@attendee2, 22)
      @item1.add_bids(@attendee1, 20)
      expect(@item1.current_high_bid).to eq(22)
    end
  end
end
