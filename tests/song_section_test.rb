require_relative '../tests/test_helper'
require 'calmotron/song'
require 'calmotron/track'
require 'calmotron/song_section'
require 'midilib'

class SongSectionTest < MiniTest::Test
  def test_main_melody
    # Main melody should be an array of notes in the given range
    song_section = SongSection.new(Song.new('C'), (1..5).to_a)
    main_melody = song_section.main_melody
    assert(main_melody.all?{|note| note.semitones_from_tonic.between?(1, 5)})
  end

  def test_add_melody_to_song
    # Main melody should be added to each song track
    song = Song.new('C')
    song.add_track(1, 2)
    song.add_track(3, 1)
    section = song.add_section((1..5).to_a)

    bass_track = song.tracks.first
    assert_equal(8, bass_track.notes.length)
    assert_equal(bass_track.notes.map(&:semitones_from_tonic), (section.main_melody.map(&:semitones_from_tonic) * 2))
    assert_equal(bass_track.notes.map(&:duration), (section.main_melody.map{ |note| note.duration * 2} * 2))

    main_track = song.tracks[1]
    assert_equal(16, main_track.notes.length)
    assert_equal(main_track.notes.map(&:semitones_from_tonic), (section.main_melody.map(&:semitones_from_tonic) * 4))
    assert_equal(main_track.notes.map(&:duration), (section.main_melody.map{ |note| note.duration } * 4))
  end
end
