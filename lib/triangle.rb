class Triangle

  attr_reader :side1, :side2, :side3

  def initialize(side1, side2, side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end
  
  def kind
    is_triangle?
    if side1 == side2 && side2 == side3
      :equilateral
    elsif side1 != side2 && side2 != side3 && side3 != side1
      :scalene
    else
      :isosceles
    end
  end

  def check_sides_for_zero
    [side1, side2, side3].each do |side|
      side.positive?
    end
  end

  def is_valid_triangle?
    side1 + side2 > side3 && side1 + side3 > side2 && side2 + side3 > side1
  end

  def is_triangle?
    raise TriangleError unless check_sides_for_zero && is_valid_triangle?
  end

  class TriangleError < StandardError
  end

end

#if side1 + side2 > side3 || side1 + side3 > side2 || side2 + side3 > side1
 # raise TriangleError
#elsif side1 < 0 || side2 < 0 || side3 < 0
#raise TriangleError
#else