require './lib/item'
require './lib/auction'
require './lib/attendee'
require 'pry'

RSpec.describe Item do
  before :each do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it 'exists and has attributes' do
    expect(@attendee.name).to eq("Megan")
    expect(@attendee.budget).to eq(50)
  end

  
end
