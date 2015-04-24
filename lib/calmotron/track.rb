class Track
  attr_reader :notes, :octave, :duration_multiplier

  def initialize(octave = 3, duration_multiplier = 1)
    @notes = []
    @octave = octave
    @duration_multiplier = duration_multiplier
  end

  def add_note(note)
    @notes << note
  end
end
