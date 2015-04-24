class MelodyNote
  attr_accessor :semitones_from_tonic, :duration

  def initialize(semitones_from_tonic, duration)
    @semitones_from_tonic = semitones_from_tonic
    @duration = duration
  end

  def self.build_random(available_semitones_from_tonic, duration_range)
    semitones_from_tonic = available_semitones_from_tonic.sample
    duration = rand(1..duration_range)
    self.new(semitones_from_tonic, duration)
  end
end
