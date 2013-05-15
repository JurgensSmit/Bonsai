class Post < ActiveRecord::Base
  attr_accessible :content, :image, :tag, :title, :image, :remote_image_url
  has_many :comments
  belongs_to :user
  validates :content, :presence => true
  validates :title, :presence => true 
    #Carrierwave
   mount_uploader :image, ImageUploader

end
