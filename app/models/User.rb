class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :first_name, :last_name, :email, :password, :birthdate, :cohort_id, :interest
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :birthdate, :presence => true
  validates :email, :presence => true
  validates :email, :uniqueness => true
  validates :cohort_id, :presence => true
  validates :interest, :presence => true
end
