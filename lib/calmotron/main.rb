require_relative 'song'
require_relative 'track'
require_relative 'note'
require 'midilib'

song = Song.new
song.add_track(1, 4)
song.add_track(3, 2)
song.add_track(4, 1)
output = song.to_midi_sequence
open('asdf.mid', 'w') { |file| output.write(file) }
