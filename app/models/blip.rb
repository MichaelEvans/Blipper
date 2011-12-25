class Blip < ActiveRecord::Base
  
  belongs_to :user
  validates_presence_of :user_id, :message, :created_at
  
end
