# item_spec.rb
require 'pry'
require 'rspec'
require './lib/item'

describe 'item' do
  it 'exists' do
    item1 = Item.new('Chalkware Piggy Bank')

    expect(item1).to be_an_instance_of Item
  end

  it 'has attributes' do
    item1 = Item.new('Chalkware Piggy Bank')

    expect(item1.name).to eq 'Chalkware Piggy Bank'
    expect(item1.bids).to eq({})
  end
end
