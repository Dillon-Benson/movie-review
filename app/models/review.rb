class Review < ActiveRecord::Base
  belongs_to :movie
  belongs_to :user

  validates :content, length: { in: 10..1024 }
end
