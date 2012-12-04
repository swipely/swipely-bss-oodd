class Rectangle
  attr_accessor :length, :width
  def area
    length * width
  end
end

class Circle
  attr_accessor :radius
  def area
    Math::PI * radius**2
  end
end

rectangle = Rectangle.new
rectangle.length = 10
rectangle.width = 5

circle = Circle.new
circle.radius = 12

[rectangle, circle].map(&:area)

