require "./lib/item"
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
      expect(item1.bids).to eq {}
    end
  end
end
