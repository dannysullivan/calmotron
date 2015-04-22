class Note
  SCALE_DEGREE_RANGE = 5
  DURATION_RANGE = 4

  attr_accessor :scale_degree, :duration

  def initialize(scale_degree, duration)
    @scale_degree = scale_degree
    @duration = duration
  end

  def self.build_random
    scale_degree = rand(1..Note::SCALE_DEGREE_RANGE)
    duration = rand(1..Note::DURATION_RANGE)
    self.new(scale_degree, duration)
  end
end
