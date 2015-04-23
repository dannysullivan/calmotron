require 'midilib'

class Song

  MIDI_NOTES = {
    1 => 0,
    2 => 2,
    3 => 4,
    4 => 7,
    5 => 9
  }

  attr_reader :tracks
  attr_reader :sections

  def initialize
    @tracks = []
    @sections = []
  end

  def add_track(octave, duration_multiplier)
    track = Track.new(octave, duration_multiplier)
    @tracks << track
    track
  end

  def add_section
    song_section = SongSection.new(self)
    @sections << song_section
    song_section
  end

  def scale_degree_to_midi_note(scale_degree, octave)
    24 + (12 * octave) + MIDI_NOTES[scale_degree]
  end

  def to_midi_sequence
    midi_song = MIDI::Sequence.new
    meta_track = MIDI::Track.new(midi_song)
    midi_song.tracks << meta_track
    meta_track.events << MIDI::ProgramChange.new(0, 0)

    tracks.each do |track|
      melody = MIDI::Track.new(midi_song)
      midi_song.tracks << melody

      track.notes.each do |note|
        midi_note = scale_degree_to_midi_note(note.scale_degree, track.octave)
        melody.events << MIDI::NoteOnEvent.new(0, midi_note, 127)
        melody.events << MIDI::NoteOffEvent.new(0, midi_note, 127, midi_song.length_to_delta(note.duration/1.0))
      end
    end

    midi_song
  end
end
