class Employee
  def initialize(person, tenure)
    @person = person
    @tenure = tenure
  end

  def after_hours_access?
    tenure >= 90 && @person.adult?
  end

  private
  attr_reader :tenure
end

