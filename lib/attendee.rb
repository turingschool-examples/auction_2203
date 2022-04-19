class Attendee

  def initialize(attendee_hash)
    @attendee_hash = attendee_hash
  end

  def name
    @attendee_hash[:name]
  end

  def budget
    @attendee_hash[:budget].slice!(0)
    @attendee_hash[:budget].to_i
  end
end
