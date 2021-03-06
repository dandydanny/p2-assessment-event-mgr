class Event < ActiveRecord::Base
  # authorship
  belongs_to :user

  has_many :event_attendances
  has_many :users, through: :event_attendances
end
