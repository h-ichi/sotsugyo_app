class Idea < ApplicationRecord
  has_many :bookmarks
  has_many :bookmarked_users, through: :bookmarks, source: :user
end
