class MediaType < ActiveRecord::Base
  has_many :media
  
  validate :name, presence: true
end
