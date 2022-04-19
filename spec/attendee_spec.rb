require 'rspec'
require './lib/attendee'

describe Attendee do
  before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

  # require 'pry' ; binding.pry

  it "is an instance of attendee" do
    expect(@attendee).to be_an_instance_of(Attendee)
  end

  it "has a name" do
    expect(@attendee.name).to eq('Megan')
  end

  it "has a budget" do
    expect(@attendee.budget).to eq('$50')
  end
  
end
