class Event < ApplicationRecord
  # validations:
  validates_presence_of :start_time, :end_time, :label, :category
end
