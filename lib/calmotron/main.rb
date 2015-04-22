require_relative 'song'
require_relative 'track'
require_relative 'note'
require 'midilib'

song = Song.new
song.add_track(5)
song.add_track(5)
output = song.to_midi_sequence
open('asdf.mid', 'w') { |file| output.write(file) }
