class Cohort < ActiveRecord::Base
  has_many :students, class_name: "User"
  attr_accessible :cohort_name, :start_date, :end_date
  validates :cohort_name, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
