class MelodyBuilder
  attr_accessor :notes

  def initialize
    @notes = []
  end

  def add_note
    new_note = Note.build_random
    if @notes.last
      last_note_scale_degree = @notes.last.scale_degree
      while new_note.scale_degree == last_note_scale_degree do
        new_note = Note.build_random
      end
    end
    @notes << new_note
  end
end
