require_relative '../tests/test_helper'
require 'calmotron/melody_builder'

class MelodyBuilderTest < Minitest::Test
  def test_add_next_note
    # Each note should be different than the one that came before it
    melody_builder = MelodyBuilder.new([1,3,5], 3)
    melody_builder.add_note
    first_note_scale_degree = melody_builder.notes.first.scale_degree
    assert([1,3,5].include?(first_note_scale_degree))
    melody_builder.add_note
    second_note_scale_degree = melody_builder.notes[1].scale_degree
    assert(second_note_scale_degree != first_note_scale_degree)
  end
end
