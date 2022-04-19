class Attendee
attr_reader :name, :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget]
  end

  def budget
    @budget.delete('$').to_i
  end
end
