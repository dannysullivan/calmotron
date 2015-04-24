require_relative '../tests/test_helper'
require 'calmotron/song'
require 'calmotron/track'
require 'midilib'

class SongTest < MiniTest::Test
  def test_scale_degree_to_midi_note
    song = Song.new
    assert_equal(song.scale_degree_to_midi_note(4, 3), 67)
  end

  def test_attributes
    valid_key_song = Song.new('A')
    assert_equal(valid_key_song.key, 'A')

    #Invalid keys default to C
    invalid_key_song = Song.new('Q')
    assert_equal(invalid_key_song.key, 'C')
  end

  def test_to_midi_sequence
    song = Song.new
    song.add_track(1, 1)
    song.add_section
    output = song.to_midi_sequence
    assert_instance_of(MIDI::Sequence, output)
    # first output track is reserved for program changes
    assert_equal(1, output.tracks.first.events.count)

    # second output track should reflect our created track
    output_track_events = output.tracks[1].events
    assert_equal(32, output_track_events.count)
    assert_instance_of(MIDI::NoteOn, output_track_events.first)
    assert_instance_of(MIDI::NoteOff, output_track_events.last)
  end

  def test_add_track
    song = Song.new
    song.add_track(1, 2)
    bass_track = song.tracks.first
    assert_equal(bass_track.octave, 1)
    assert_equal(bass_track.duration_multiplier, 2)
  end
end
