class Followship < ApplicationRecord
  validates :following_id, uniqueness: { scope: :user_id }
  belong_to :user
  belong_to :following, class_name: "User"
end
