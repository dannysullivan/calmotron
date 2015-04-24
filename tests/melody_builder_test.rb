require_relative '../tests/test_helper'
require 'calmotron/melody_builder'

class MelodyBuilderTest < Minitest::Test
  def test_add_next_note
    # Each note should be different than the one that came before it
    melody_builder = MelodyBuilder.new([1,3,5], 3)
    melody_builder.add_note
    first_note_semitones_from_tonic = melody_builder.notes.first.semitones_from_tonic
    assert([1,3,5].include?(first_note_semitones_from_tonic))
    melody_builder.add_note
    second_note_semitones_from_tonic = melody_builder.notes[1].semitones_from_tonic
    assert(second_note_semitones_from_tonic != first_note_semitones_from_tonic)
  end
end
