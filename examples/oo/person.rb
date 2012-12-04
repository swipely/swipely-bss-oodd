class Person
  attr_reader :name
  attr_accessor :age

  def initialize(first_name, last_name, age)
    @name = create_full_name(first_name, last_name)
    @age = age
  end

  protected
  def adult?
    @age >= 18  
  end

  private
  def create_full_name(first_name, last_name)
    "#{first_name} #{last_name}"
  end
end

