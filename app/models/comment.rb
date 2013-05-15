class Comment < ActiveRecord::Base
  belongs_to :post, :dependent => :destroy
  attr_accessible :content

validates :content, :presence =>true

end
