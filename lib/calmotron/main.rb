require_relative 'song'
require_relative 'track'
require_relative 'note'
require_relative 'song_section'
require 'midilib'
require 'pry'

song = Song.new
song.add_track(1, 4)
song.add_track(3, 2)
song.add_track(4, 1)

song.add_section
song.add_section

output = song.to_midi_sequence
open('asdf.mid', 'w') { |file| output.write(file) }
