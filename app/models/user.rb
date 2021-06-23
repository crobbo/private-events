class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
      
  has_many :events,  foreign_key: "creator_id", class_name: "Event"
  has_many :attended_event, through: :attended_event, source: "Event"
end
