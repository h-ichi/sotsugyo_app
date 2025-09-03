class User < ApplicationRecord
  # Devise の認証系
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 関連付け
  has_many :diaries, dependent: :destroy
  has_many :bookmarks
  has_many :bookmarked_ideas, through: :bookmarks, source: :idea
end
