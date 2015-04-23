require_relative '../tests/test_helper'
require 'calmotron/song'
require 'calmotron/track'
require 'midilib'

class SongTest < MiniTest::Test
  def test_main_melody
    # Main melody should be an array of pentatonic scale degrees
    song = Song.new
    main_melody = song.main_melody
    assert(main_melody.all?{|note| note.scale_degree.between?(1, 5)})
  end

  def test_scale_degree_to_midi_note
    song = Song.new
    assert_equal(song.scale_degree_to_midi_note(4, 3), 67)
  end

  def test_to_midi_sequence
    song = Song.new
    song.add_track(1, 1)
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
    main_melody = song.main_melody
    song.add_track(1, 2)
    bass_track = song.tracks.first
    assert_equal(bass_track.octave, 1)
    assert_equal(8, bass_track.notes.length)
    assert_equal(bass_track.notes.map(&:scale_degree), (main_melody.map(&:scale_degree) * 2))
    assert_equal(bass_track.notes.map(&:duration), (main_melody.map{ |note| note.duration * 2} * 2))
  end
end
