require_relative 'song'
require_relative 'track'
require_relative 'melody_note'
require_relative 'song_section'
require_relative 'melody_builder'
require 'midilib'
require 'pry'

song = Song.new('B')
song.add_track(1, 4)
song.add_track(3, 2)
song.add_track(4, 1)

song.add_section((1..5).to_a)
song.add_section((1..5).to_a)
song.add_section((1..5).to_a)
song.add_section((1..5).to_a)

output = song.to_midi_sequence
open('asdf.mid', 'w') { |file| output.write(file) }
