class MelodyBuilder
  attr_reader :notes, :available_semitones_from_tonic, :duration_range

  def initialize(available_semitones_from_tonic, duration_range)
    @notes = []
    @available_semitones_from_tonic = available_semitones_from_tonic
    @duration_range = duration_range
  end

  def add_note
    new_note = MelodyNote.build_random(available_semitones_from_tonic, duration_range)
    last_note_semitones_from_tonic = notes.last ? notes.last.semitones_from_tonic : nil
    different_semitones = available_semitones_from_tonic - [last_note_semitones_from_tonic]
    new_note = MelodyNote.build_random(different_semitones, duration_range)
    @notes << new_note
  end
end
