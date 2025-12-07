class ParkingSystem
  def initialize(big, medium, small)
    @big = big
    @medium = medium
    @small = small
  end

  def add_car(car_type)
    if has_space?(car_type)
      case car_type
      when 1
        decrement_big_space
      when 2
        decrement_medium_space
      when 3
        decrement_small_space
      end

      true
    else
      false
    end
  end

  private

  def has_space?(car_type)
    case car_type
    when 1
      @big > 0
    when 2
      @medium > 0
    when 3
      @small > 0
    end
  end

  def decrement_medium_space
    @medium -= 1
  end

  def decrement_small_space
    @small -= 1
  end

  def decrement_big_space
    @big -= 1
  end
end
