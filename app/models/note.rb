class Note < ApplicationRecord
  include PgSearch
  belongs_to :user, optional: true
  has_many :taggings
  has_many :tags, through: :taggings

  has_paper_trail

  validates :title, :body, presence: true

  default_scope { order(created_at: :desc) }

  pg_search_scope :search_title_and_body, :against => [:title, :body]

  def tags=(string)
    if string.is_a? String
      string.split(",").map(&:strip).each do |t|
        tags << Tag.find_or_initialize_by(name: t)
      end
    else
      super(string)
    end
  end

end
