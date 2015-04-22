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

  def test_create_main_melody
    # Main melody should be an array of pentatonic scale degrees
    song = Song.new
    song.create_main_melody
    main_melody = song.main_melody
    assert(main_melody.all?{|note| note.scale_degree.between?(1, 5)})
  end

  def test_scale_degree_to_midi_note
    song = Song.new
    assert_equal(song.scale_degree_to_midi_note(4), 67)
  end

  def test_to_midi_sequence
    song = Song.new
    song.add_track(5)
    output = song.to_midi_sequence
    assert_instance_of(MIDI::Sequence, output)
  end

  def test_add_bass_track
    song = Song.new
    song.create_main_melody
    main_melody = song.main_melody
    song.add_bass_track
    bass_track = song.tracks.first
    assert_equal(bass_track.notes.map(&:scale_degree), main_melody.map(&:scale_degree))
    assert_equal(bass_track.notes.map(&:duration), main_melody.map{ |note| note.duration * Song::BASS_DURATION_MULTIPLIER})
  end
end
