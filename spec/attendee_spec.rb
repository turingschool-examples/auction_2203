require './lib/item'
require './lib/attendee'

RSpec.describe Attendee do
  before :each do

    @attendee = Attendee.new({name: 'Megan', budget: '$50'})
  end

end
