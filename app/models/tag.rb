class Tag < ActiveRecord::Base
  has_many :tag_instances
  
  validate :label, presence: true
  
  def self.getAll()
     #find(:all, :conditions => ['path = ?', "#{search}"])
     find(:all)
     end
end
