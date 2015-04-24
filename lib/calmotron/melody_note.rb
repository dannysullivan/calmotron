class MelodyNote
  attr_accessor :scale_degree, :duration

  def initialize(scale_degree, duration)
    @scale_degree = scale_degree
    @duration = duration
  end

  def self.build_random(available_scale_degrees, duration_range)
    scale_degree = available_scale_degrees.sample
    duration = rand(1..duration_range)
    self.new(scale_degree, duration)
  end
end
