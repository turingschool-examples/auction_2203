require "rspec"
require "./lib/item"
require "./lib/attendee"
require "./lib/auction"
require "pry"

RSpec.describe Attendee do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    @auction = Auction.new
  end

  it "exists" do
    expect(@auction).to be_a Auction
  end

  it "has attributes" do
    expect(@auction.items).to eq []
  end

  it "has can add items to a actions item array" do
    @auction.add_item(@item1)
    @auction.add_item(@item2)
    expect(@auction.items).to eq [@item1, @item2]
    expect(@auction.item_names).to eq ["Chalkware Piggy Bank", "Bamboo Picture Frame"]
  end

  describe "Iteration II" do
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

    it "can initialize items to start with no bids" do
      expect(@item1.bids).to eq ({})
    end

    it "can add bids to a certain item" do
      @item1.add_bid(@attendee2, 22)
      @item1.add_bid(@attendee1, 20)

      expected = {
        @attendee1 => 20,
        @attendee2 => 22
      }

      expect(@item1.bids).to eq expected
    end

    it "can list unpopular items within an array" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      expect(@auction.unpopular_items).to eq [@item2, @item3, @item5]
    end

    it "can list unpopular items within an array" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.unpopular_items).to eq [@item2, @item5]
    end

    it "can take the max bids per each item and add them to a possible revenue" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      expect(@auction.potential_revenue).to eq 87
    end

    describe "Iteration III" do
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
      # @item1.add_bid(@attendee1, 22)
      # @item1.add_bid(@attendee2, 20)
      # @item4.add_bid(@attendee3, 50)
      # @item3.add_bid(@attendee2, 15)
    end

    it "can return a list of bidders at the auction" do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)
      # binding.pry
      expect(@auction.bidders).to eq ["Megan", "Bob", "Mike"]
    end

    it "can return the bids on a item, and close the bids so that it wont accept more" do
      @item1.add_bid(@attendee1, 22)
      @item1.add_bid(@attendee2, 20)
      @item4.add_bid(@attendee3, 50)
      @item3.add_bid(@attendee2, 15)

      expected = {
        @attendee1 => 22,
        @attendee2 => 20
      }

      expect(@item1.bids).to eq expected

      @item1.close_bidding
      @item1.add_bid(@attendee3, 70)

      expect(@item1.bids).to eq expected
    end
  end
end
