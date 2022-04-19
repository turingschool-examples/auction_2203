require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Item do
  before :each do
    @auction = Auction.new
  end

  it 'shows items as an empty array' do
    expect(@auction.items).to eq([])
  end

  it 'can add items to the auction' do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.items).to eq([@item1, @item2])
  end

  it 'can show an array of item names' do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @auction.add_item(@item1)
    @auction.add_item(@item2)

    expect(@auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
  end

  describe 'iteration 2' do
    before :each do
     @item1 = Item.new('Chalkware Piggy Bank')
     @item2 = Item.new('Bamboo Picture Frame')
     @item3 = Item.new('Homemade Chocolate Chip Cookies')
     @item4 = Item.new('2 Days Dogsitting')
     @item5 = Item.new('Forever Stamps')
     @attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
     @attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
     @attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
     @auction = Auction.new
     @auction.add_item(@item1)
     @auction.add_item(@item2)
     @auction.add_item(@item3)
     @auction.add_item(@item4)
     @auction.add_item(@item5)

    end

    it 'creates a hash of bid for each item' do
      expect(@item1.bids).to eq({})
    end

    it 'can add a bid to an item with a hash of attendee and their bid' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expected = {
        @attendee2 => 20,
        @attendee1 => 22
      }
# binding.pry
      expect(@item1.bids).to eq(expected)
    end

    it 'can list the current high bid of all bids on that item' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq(22)
    end

    it 'can show an array of unpopular items(items with no bids)' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq([@item2, @item3, @item5])
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq([@item2, @item5])
    end

    it 'can show the potential revenue of the highest current bids for the auction' do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expect(@auction.potential_revenue).to eq(87)
    end

    describe 'iteration 3' do
      before :each do
        @item1.add_bid(@attendee1, 22)
        @item1.add_bid(@attendee2, 20)
        @item4.add_bid(@attendee3, 50)
        @item3.add_bid(@attendee2, 15)
      end

      it 'shows an array of the current bidders at the auction' do
        expect(@auction.bidders).to eq(["Megan", "Bob", "Mike"])
      end
    end
  end

end
