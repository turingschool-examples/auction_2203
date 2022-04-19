require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before :each do

    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  it "exists" do


    expect(@attendee).to be_a(Attendee)
  end

  it "has attributes" do


    expect(@attendee.name).to eq('Megan')
    expect(@attendee.budget).to eq('50')
    #Don't know how @attendee.budget is supposed to show up as '$50'
  end

end
