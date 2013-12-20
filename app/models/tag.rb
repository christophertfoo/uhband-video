class Tag < ActiveRecord::Base
  has_many :tag_instances
  
  validate :label, presence: true
  
  
  def self.searchById(search)
     if search
        find(:all, :conditions => ['tags_id = ?', "#{search}"])
      else
        find(:all)
      end
  end
  
  def self.searchByLabel(search)
    if search
      find(:all, :conditions => ['label like ?', "#{search}"])
    else
      find(:all)
    end
  end
  
  
  def self.getAll()
     find(:all)
     end
end
