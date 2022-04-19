class Attendee
  attr_reader :name,
              :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].delete_prefix('$').to_i
  end
end
