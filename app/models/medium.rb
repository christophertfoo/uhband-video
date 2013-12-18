class Medium < ActiveRecord::Base
  belongs_to :media_type #foreign key - media_type_id
  has_many :tag_instances
  
  validate :path, presence: true
  validate :creationtime, presence: true
  
  def self.search()
      if search
        #find(:all, :conditions => ['media_id like ?', "%#{search}%"])
        find(:all, :conditions => ['media_id like 1'])
      else
        find(:all)
      end
  end
  

end

  medium.search()
