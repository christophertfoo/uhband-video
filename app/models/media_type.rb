class MediaType < ActiveRecord::Base
  has_many :media
  
  validate :name, presence: true
  
  def self.searchById(search)
     if search
        find(:all, :conditions => ['media_type_id = ?', "#{search}"])
      else
        find(:all)
      end
  end
  
  
    def self.getAll()
     find(:all)
  end
end
