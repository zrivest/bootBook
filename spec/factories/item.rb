FactoryGirl.define do
  factory :item do
    # id 1
    # user_id 1
  end

  trait :status do
    user_id 1
    wall_owner_id 2
    item_type  "status"
    content "Hey man, nice shot."
  end

  trait :comment do
    user_id 2
    item_type "comment"
    content "Thanks a lot, bro"
    relation_id 1
  end

  # factory :comment_item do
  #   type "Comment"
  #   id 2
  #   owner_id 1
  #   relation_id 1
  # end

end