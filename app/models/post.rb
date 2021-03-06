class Post < ActiveRecord::Base

  attr_accessible :content, :image, :tag, :title, :image, :remote_image_url, :category
  belongs_to :user, :dependent => :destroy
  validates :content, :presence => true
  validates :title, :presence => true 
    #Carrierwave
   mount_uploader :image, ImageUploader

default_scope order: 'posts.created_at DESC'
self.per_page = 6
acts_as_voteable
end