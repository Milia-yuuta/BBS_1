class Post < ApplicationRecord
  validates :text, presence: true
  belongs_to :user
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  def self.search(search)
    if search
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end

  def save_tags(tag)
    # Create new taggings:
    new_tags.each do |new_name|
      binding.pry
      Tag.find_or_create_by(name:new_name)
    end
  end
  
end
