class Employee < Person
  def initialize(first_name, last_name, age, tenure)
    super(first_name, last_name, age)
    @tenure = tenure
  end

  def after_hours_access?
    tenure >= 90 && adult?
  end

  private
  attr_reader :tenure
end

