require_relative '../tests/test_helper'
require 'calmotron/track'

class TrackTest < MiniTest::Test

  def test_add_random_note
    track = Track.new
    assert_equal(track.notes.length, 0)
    track.add_random_note
    assert_equal(track.notes.length, 1)
  end
end
