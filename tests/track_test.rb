require_relative '../tests/test_helper'
require 'calmotron/track'
require 'calmotron/melody_note'

class TrackTest < MiniTest::Test

  def test_add_note
    track = Track.new
    assert_equal(0, track.notes.length)
    track.add_note(MelodyNote.build_random([1], 1))
    assert_equal(1, track.notes.length)
  end
end
