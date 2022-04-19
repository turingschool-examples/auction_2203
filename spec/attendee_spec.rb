require './lib/attendee'
require 'Rspec'

describe Attendee do
  context 'Iteration 1' do
    before(:each) do
    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
    end

    it 'exists' do
      expect(@attendee).to be_an_instance_of(Attendee)
    end

    it 'has readable attributes' do
      expect(@attendee.name).to eq('Megan')
      expect(@attendee.budget).to eq(50)
    end
  end
end
