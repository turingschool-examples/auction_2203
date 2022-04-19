
class Attendee
  attr_reader :name,
              :budget
  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].reverse.chop!.reverse.to_i
  end
end
