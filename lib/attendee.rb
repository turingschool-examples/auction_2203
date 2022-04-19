class Attendee
  attr_reader :name,
              :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].slice(1..).to_i
  end
end
