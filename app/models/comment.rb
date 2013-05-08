class Comment < ActiveRecord::Base
  belongs_to :commenter
  attr_accessible :content

validates :content, :presence =>true

end
