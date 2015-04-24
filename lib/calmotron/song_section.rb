class SongSection

  MELODY_NOTE_COUNT = 4
  DURATION_RANGE = 4
  OVERALL_LENGTH = 4

  attr_reader :song, :main_melody, :available_semitones_from_tonic

  def initialize(song, available_semitones_from_tonic)
    @song = song
    @available_semitones_from_tonic = available_semitones_from_tonic
    create_main_melody
    add_melody_to_song
  end

  def add_melody_to_song
    song.tracks.each do |track|
      repeats = (OVERALL_LENGTH / track.duration_multiplier).to_i # so all tracks end at the same time
      repeats.times do
        main_melody.each do |note|
          note = MelodyNote.new(
            note.semitones_from_tonic,
            note.duration * track.duration_multiplier
          )
          track.add_note(note)
        end
      end
    end
  end

  def create_main_melody
    melody_builder = MelodyBuilder.new(available_semitones_from_tonic, DURATION_RANGE)
    MELODY_NOTE_COUNT.times do
      melody_builder.add_note
    end
    @main_melody = melody_builder.notes
  end
end
