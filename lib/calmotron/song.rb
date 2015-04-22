require 'midilib'

class Song
  MELODY_NOTE_COUNT = 5
  BASS_DURATION_MULTIPLIER = 2
  MIDI_NOTES = {
    1 => 60,
    2 => 62,
    3 => 64,
    4 => 67,
    5 => 68
  }
  attr_reader :tracks
  attr_reader :main_melody

  def initialize
    @tracks = []
  end

  def add_track(number_of_notes)
    track = Track.new
    number_of_notes.times do
      track.add_random_note
    end
    @tracks << track
  end

  def add_bass_track
    bass_track = Track.new
    @main_melody.each do |note|
      note = Note.new(
        note.scale_degree,
        note.duration * BASS_DURATION_MULTIPLIER
      )
      bass_track.add_note(note)
    end
    @tracks << bass_track
  end

  def create_main_melody
    @main_melody = []
    MELODY_NOTE_COUNT.times do
      @main_melody << Note.build_random
    end
    @main_melody
  end

  def scale_degree_to_midi_note(scale_degree)
    MIDI_NOTES[scale_degree]
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
        midi_note = note.scale_degree + 100
        melody.events << MIDI::NoteOnEvent.new(0, midi_note, 127)
        melody.events << MIDI::NoteOffEvent.new(0, midi_note, 127, midi_song.length_to_delta(note.duration/1.0))
      end
    end

    open('asdf.mid', 'w') { |file| midi_song.write(file) }
    midi_song
  end
end
