class Item < ActiveRecord::Base

  before_save :check_type

  attr_accessible :item_type, :content
  belongs_to :wall_owner, class_name: "User", foreign_key: "wall_owner_id"
  belongs_to :owner, class_name: "User", foreign_key: "user_id"
  has_many :comments, class_name: "Item", foreign_key: "relation_id"
  belongs_to :parent, class_name: "Item", foreign_key: "relation_id"

  validates_presence_of :user_id, :item_type, :content
  validates :item_type, inclusion: { in: %w(status comment), message: "%(value) is not a valid item type" }

  act_as_likeable

  private

  def check_type
    case item_type
    when "status"
      self.parent = nil
    when "comment"
      self.comments = []
    end
  end

end
