class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def is_liked?(user)
    self.liked_users.include?(user)
  end
end
