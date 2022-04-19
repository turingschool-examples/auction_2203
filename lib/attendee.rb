class Attendee
  attr_reader :name,
              :budget

  def initialize(input)
    @name = input[:name]
    @budget = input[:budget]
  end
end
