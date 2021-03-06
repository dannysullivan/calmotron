require_relative '../tests/test_helper'
require 'calmotron/melody_note'

class MelodyNoteTest < Minitest::Test
  def test_attributes
    note = MelodyNote.new(1, 2)
    assert_equal(note.semitones_from_tonic, 1)
    assert_equal(note.duration, 2)
  end

  def test_build_random
    note = MelodyNote.build_random([1,3], 3)
    assert([1,3].include?(note.semitones_from_tonic))
    assert(note.duration.between?(1,3))
  end
end
