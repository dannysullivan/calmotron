class Track
  attr_reader :notes, :octave

  def initialize(octave = 3)
    @notes = []
    @octave = octave
  end

  def add_random_note
    @notes << Note.build_random
  end

  def add_note(note)
    @notes << note
  end
end
