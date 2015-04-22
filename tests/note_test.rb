require_relative '../tests/test_helper'
require 'calmotron/note'

class NoteTest < Minitest::Test
  def test_attributes
    note = Note.new(1, 16)
    assert_equal(note.scale_degree, 1)
    assert_equal(note.duration, 16)
  end
end
