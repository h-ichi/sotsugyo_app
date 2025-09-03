class Diary < ApplicationRecord
  belongs_to :user   
  has_one_attached :image
  has_many :diaries, dependent: :destroy

  validates :title, presence: true
  validates :diary_date, presence: true
  validates :content, presence: true
end
