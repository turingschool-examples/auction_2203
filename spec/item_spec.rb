require "./lib/item"
require "./lib/attendee"
require "rspec"

RSpec.describe Item do
  describe "Iteration 1" do
    it "exists" do
      item1 = Item.new('Chalkware Piggy Bank')
      expect(item1).to be_a Item
    end

    it "has readable attributes" do
      item1 = Item.new('Chalkware Piggy Bank')
      expect(item1.name).to eq 'Chalkware Piggy Bank'
    end
  end

  describe "Iteration 2" do
    it "has no bids by default" do
      item1 = Item.new('Chalkware Piggy Bank')
      expect(item1.bids).to eq({})
    end

    it "can add bids" do
      item1 = Item.new('Chalkware Piggy Bank')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to eq({attendee2 => 20, attendee1 => 22})
    end

    it "can determine the current high bid" do
      item1 = Item.new('Chalkware Piggy Bank')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      item1.add_bid(attendee2, 20)
      item1.add_bid(attendee1, 22)
      expect(item1.current_high_bid).to eq(22)
    end
  end

  describe "Iteration 3" do
    it "open for bidding is true by default" do
      item1 = Item.new('Chalkware Piggy Bank')
      expect(item1.open_for_bidding).to eq(true)
    end
    it "can close bidding" do
      item1 = Item.new('Chalkware Piggy Bank')
      attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
      attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
      item1.add_bid(attendee2, 20)
      item1.close_bidding
      item1.add_bid(attendee1, 22)
      expect(item1.bids).to eq({attendee2 => 20})
    end
  end
end
