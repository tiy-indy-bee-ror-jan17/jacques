class Note < ApplicationRecord
  has_many :taggings
  belongs_to :user, optional: true
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

  default_scope { order('created_at desc')}

  # def tags=(string)
  #   if string.is_a? String
  #     string.split(",").map(&:strip).each do |t|
  #       tags << Tag.find_or_initialize_by(name: t)
  #     end
  #   else
  #     super(string)
  #   end
  # end

end
