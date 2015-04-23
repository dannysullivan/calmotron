class SongSection

  MELODY_NOTE_COUNT = 4
  OVERALL_LENGTH = 4

  attr_reader :song
  attr_reader :main_melody

  def initialize(song)
    @song = song
    create_main_melody
    add_melody_to_song
  end

  def add_melody_to_song
    song.tracks.each do |track|
      repeats = (OVERALL_LENGTH / track.duration_multiplier).to_i # so all tracks end at the same time
      repeats.times do
        main_melody.each do |note|
          note = Note.new(
            note.scale_degree,
            note.duration * track.duration_multiplier
          )
          track.add_note(note)
        end
      end
    end
  end

  def create_main_melody
    @main_melody = []
    MELODY_NOTE_COUNT.times do
      @main_melody << Note.build_random
    end
    @main_melody
  end
end
