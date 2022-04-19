class Attendee
  attr_reader :name, :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget]

  end

  def budget
    @budget.gsub(/[^0-9]/, '').to_i
  end

end

#.gsub(/[^0-9]/, '').to_i
