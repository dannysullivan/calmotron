module MusicTheory

  FIRST_NOTE_IN_KEY = {
    'C'  => 24,
    'C#' => 25,
    'D'  => 26,
    'D#' => 27,
    'E'  => 28,
    'F'  => 29,
    'F#' => 30,
    'G'  => 31,
    'G#' => 32,
    'A'  => 33,
    'A#' => 34,
    'B'  => 35
  }

  PENTATONIC_SCALE = [0, 2, 4, 7, 9]

  def self.semitones_from_tonic_to_midi_note(semitones_from_tonic, octave, key)
    FIRST_NOTE_IN_KEY[key] + (12 * octave) + semitones_from_tonic
  end
end
