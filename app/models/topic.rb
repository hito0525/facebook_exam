class Topic < ActiveRecord::Base
  validates :title, :content, presence: true
  belongs_to :user
end
