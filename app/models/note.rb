class Note < ApplicationRecord

  has_many :tags, through: :taggings
  has_many :taggings, dependent: :destroy

  belongs_to :user, optional: true #require:false same as optional:true

  validates :title, :body, presence: true

  # def tags=(string)
  #   if string.is_a? stringstring.spliut(",").map(&:strip).each do |t|
  #     tags << Tag.find_or_initialize_by(name: t)
  #     end
  #   else
  #     super(string)
  #   end
  # end
  #you can do this versus doing split on the create method, add :tags params

end
