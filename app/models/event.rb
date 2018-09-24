class Event < ApplicationRecord
  belongs_to :category
  # validations:
  validates_presence_of :start_time, :end_time, :label, :category_id
  validates_uniqueness_of :start_time, :end_time
end
