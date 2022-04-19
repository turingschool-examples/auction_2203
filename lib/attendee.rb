class Attendee
  attr_reader :name,
              :budget

  def initialize(attributes)
    @name = attributes[:name]
    @budget = attributes[:budget].tr('$', '').to_i
  end




end
