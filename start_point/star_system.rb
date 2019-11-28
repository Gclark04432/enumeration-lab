class StarSystem
  attr_reader :name, :planets

  def initialize(name, planets)
    @name = name
    @planets = planets
  end

  def planet_names(planets = @planets)
    planets.map { |planet| planet.name()}
  end

  def get_planet_by_name(planet_name)
    @planets.find { |planet| planet.name == planet_name }
  end

  def get_largest_planet()
    @planets.max_by { |planet| planet.diameter}
  end

  def get_smallest_planet()
    @planets.min_by { |planet| planet.diameter}
  end

  def get_planets_with_no_moons()
    @planets.select { |planet| planet.number_of_moons == 0 }
  end

  def get_planets_with_more_moons(moons)
    valid_planets = @planets.find_all { |planet| planet.number_of_moons > moons}
    planet_names(valid_planets)
  end

  def get_number_of_planets_closer_than(distance)
    valid_planets = @planets.select { |planet| planet.distance_from_sun < distance}
    return valid_planets.length
  end

  def get_total_number_of_moons
    planet_moons = @planets.map { |planet| planet.number_of_moons}
    total_moons = planet_moons.reduce {|running_total, moons| running_total + moons}
  end

  def get_planet_names_sorted_by_increasing_distance_from_sun
    planets_in_order = @planets.sort_by { |planet| planet.distance_from_sun}
    planet_names(planets_in_order)
  end

  def get_planet_names_sorted_by_size_decreasing
    planets_in_order = @planets.sort_by { |planet| -planet.diameter}
    planet_names(planets_in_order)
  end

end
