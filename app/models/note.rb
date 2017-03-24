class Note < ApplicationRecord

  belongs_to :user, optional: true
  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, :body, presence: true

  def tags=(string)
    if string.is_a? String
      string.split(",").collect(&:strip).each do |t|
       tags << Tag.find_or_initialize_by(name: t)
      end
    else
      super(string)
    end
  end

end
