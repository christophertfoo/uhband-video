class MediaType < ActiveRecord::Base
  has_many :media
  
  validate :name, presence: true
  
    def self.getAll()
     find(:all)
  end
end
