require_relative 'song'
require_relative 'track'
require_relative 'melody_note'
require_relative 'song_section'
require_relative 'melody_builder'
require_relative 'music_theory'
require 'midilib'

song = Song.new('D')
song.add_track(1, 4)
song.add_track(3, 2)
song.add_track(4, 1)

song.add_section(MusicTheory::PENTATONIC_SCALE)
song.add_section(MusicTheory::MAJOR_SCALE)
song.add_section(MusicTheory::PENTATONIC_SCALE)

output = song.to_midi_sequence
open('asdf.mid', 'w') { |file| output.write(file) }
