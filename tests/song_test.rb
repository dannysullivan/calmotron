require_relative '../tests/test_helper'
require 'calmotron/song'
require 'calmotron/track'
require 'midilib'

class SongTest < MiniTest::Test
  def test_add_track
    song = Song.new
    assert_equal(song.tracks.length, 0)
    song.add_track(5)
    assert_equal(song.tracks.length, 1)
    assert_equal(song.tracks.first.notes.length, 5)
  end

  def test_to_midi_sequence
    song = Song.new
    song.add_track(5)
    output = song.to_midi_sequence
    assert_instance_of(MIDI::Sequence, output)
  end
end
