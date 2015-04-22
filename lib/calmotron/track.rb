class Track
  attr_reader :notes

  def initialize
    @notes = []
  end

  def add_random_note
    @notes << Note.build_random
  end

  def add_note(note)
    @notes << note
  end
end
