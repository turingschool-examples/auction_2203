require "rspec"
require "./lib/item"
require "./lib/auction"
require "./lib/attendee"
require "pry"

RSpec.describe Item do
  before :each do
    @item1 = Item.new('Chalkware Piggy Bank')
    @item2 = Item.new('Bamboo Picture Frame')
  end

  it "exists" do
    expect(@item1).to be_a Item
  end

  it "has attributes" do
    expect(@item1.name).to eq 'Chalkware Piggy Bank'
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
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)

      expected = {
        @attendee2 => 20,
        @attendee1 => 22
      }

      expect(@item1.bids).to eq expected
    end

    it "can return the highest current bid for a item" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect(@item1.current_high_bid).to eq 22
    end

    xit "can list unpopular items within an array" do
      @item1.add_bid(@attendee2, 20)
      @item1.add_bid(@attendee1, 22)
      expect
    end
  end
end
