class Status < ActiveRecord::Base
  attr_accessible :status, :user_id

  belongs_to :user
end
