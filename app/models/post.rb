class Post < ActiveRecord::Base
  attr_accessible :content, :image, :tag, :title, :category
  has_many :comments
  belongs_to :user
  validates :content, :presence => true
  validates :title, :presence => true

end
