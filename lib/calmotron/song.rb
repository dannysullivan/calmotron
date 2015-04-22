require 'midilib'

class Song

  MELODY_NOTE_COUNT = 4
  OVERALL_LENGTH = 4

  MIDI_NOTES = {
    1 => 0,
    2 => 2,
    3 => 4,
    4 => 7,
    5 => 9
  }

  attr_reader :tracks
  attr_reader :main_melody

  def initialize
    @tracks = []
    create_main_melody
  end

  def add_track(octave, duration_multiplier)
    track = Track.new(octave)
    repeats = (OVERALL_LENGTH / duration_multiplier).to_i # so all tracks end at the same time

    repeats.times do
      main_melody.each do |note|
        note = Note.new(
          note.scale_degree,
          note.duration * duration_multiplier
        )
        track.add_note(note)
      end
    end
    @tracks << track
  end

  def create_main_melody
    @main_melody = []
    MELODY_NOTE_COUNT.times do
      @main_melody << Note.build_random
    end
    @main_melody
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

    open('asdf.mid', 'w') { |file| midi_song.write(file) }
    midi_song
  end
end
