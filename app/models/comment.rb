class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :prototype

  validates :comment,:prototype,:user, presence: true
end
