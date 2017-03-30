class LineItemSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :note_title

  def note_title
    object.note.title
  end

  # class NoteSerializer < ActiveModel::Serializer
  #   attributes :title, :body, :formatted_body, :created_at, :updated_at
  #   has_one :user # There's one of these.
  #   has_many :tags # There's a bunch of these. Make it an array
  #
  #   def formatted_body
  #     Kramdown::Document.new(object.body).to_html
  #   end
  # end
end
