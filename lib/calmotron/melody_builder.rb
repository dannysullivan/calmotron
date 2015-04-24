class MelodyBuilder
  attr_reader :notes, :available_scale_degrees, :duration_range

  def initialize(available_scale_degrees, duration_range)
    @notes = []
    @available_scale_degrees = available_scale_degrees
    @duration_range = duration_range
  end

  def add_note
    new_note = MelodyNote.build_random(available_scale_degrees, duration_range)
    if notes.last
      last_note_scale_degree = notes.last.scale_degree
      while new_note.scale_degree == last_note_scale_degree do
        new_note = MelodyNote.build_random(available_scale_degrees, duration_range)
      end
    end
    @notes << new_note
  end
end
