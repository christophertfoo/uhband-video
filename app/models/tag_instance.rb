class TagInstance < ActiveRecord::Base

 
  belongs_to :media #foreign key - media_id
  belongs_to :tags #foreign_key -tags_id

  validate :timestamp, presence: true
end