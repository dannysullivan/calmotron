require 'midilib'

class Song
  attr_reader :tracks

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
