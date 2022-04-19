require 'rspec'
require './lib/attendee'

RSpec.describe Attendee do
  describe 'object' do
    before :each do
      @attendee = Attendee.new({ name: 'Megan', budget: '$50' })
    end

    it 'has a name' do
      expect(@attendee.name).to eq 'Megan'
    end

    it 'has a budget' do
      expect(@attendee.budget).to eq 50
    end
  end
end
