require 'midilib'

class Song

  attr_reader :tracks, :sections, :key

  def initialize(key)
    @tracks = []
    @sections = []
    if MusicTheory::FIRST_NOTE_IN_KEY.keys.include?(key)
      @key = key
    else
      @key = 'C'
    end
  end

  def add_bass_track
    @tracks << BassTrack.new
  end

  def add_track(octave, duration_multiplier)
    track = Track.new(octave, duration_multiplier)
    @tracks << track
    track
  end

  def add_section(available_scale_degrees)
    song_section = SongSection.new(self, available_scale_degrees)
    @sections << song_section
    song_section
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
        midi_note = MusicTheory.semitones_from_tonic_to_midi_note(note.semitones_from_tonic, track.octave, key)
        melody.events << MIDI::NoteOnEvent.new(0, midi_note, 15)
        melody.events << MIDI::NoteOffEvent.new(0, midi_note, 15, midi_song.length_to_delta(note.duration/1.0))
      end
    end

    midi_song
  end
end
