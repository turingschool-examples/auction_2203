require './lib/item'
require './lib/auction'
require './lib/attendee'

RSpec.describe Item do
  before :each do
    item1 = Item.new('Chalkware Piggy Bank')
  end

  it 'exists and has attributes' do
    expect(item1).to be Item
    expect(item1.name).to eq 'Chalkware Piggy Bank'
  end 
end
