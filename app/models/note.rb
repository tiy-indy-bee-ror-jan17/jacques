class Note < ApplicationRecord

  belongs_to :user, optional: true
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

  serialize :body

  default_scope { order(created_at: :desc)}

  # def tags=(string)       => allows :tags as a user_param in UsersController
  #   if string.is_a? String
  #     string.split(",").map(&:strip).each do |t|
  #       tags << Tag.find_or_initialize_by(name: t)
  #     end
  #   else
  #     super(string)
  #   end
  # end

end
