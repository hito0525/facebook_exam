class Topic < ActiveRecord::Base
  validates :title, :content, presence: true
end
