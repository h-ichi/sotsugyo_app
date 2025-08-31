class Diary < ApplicationRecord
  class Diary < ApplicationRecord
    has_one_attached :image
  
    validates :title, presence: true
    validates :diary_date, presence: true
    validates :content, presence: true
  end
  
end
