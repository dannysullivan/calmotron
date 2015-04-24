class MelodyBuilder
  attr_reader :notes, :available_semitones_from_tonic, :duration_range

  def initialize(available_semitones_from_tonic, duration_range)
    @notes = []
    @available_semitones_from_tonic = available_semitones_from_tonic
    @duration_range = duration_range
  end

  def add_note
    new_note = MelodyNote.build_random(available_semitones_from_tonic, duration_range)
    if notes.last
      last_note_semitones_from_tonic = notes.last.semitones_from_tonic
      while new_note.semitones_from_tonic == last_note_semitones_from_tonic do
        new_note = MelodyNote.build_random(available_semitones_from_tonic, duration_range)
      end
    end
    @notes << new_note
  end
end
