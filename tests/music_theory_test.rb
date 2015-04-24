require_relative '../tests/test_helper'
require 'calmotron/music_theory'

class MusicTheoryTest < Minitest::Test
  def test_scale_degree_to_midi_note
    assert_equal(64, MusicTheory.semitones_from_tonic_to_midi_note(4, 3, 'C'))
  end
end
